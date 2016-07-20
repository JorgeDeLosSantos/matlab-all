function varargout = texed(varargin)
%TEXED TeX equation editor
%   TEXED starts an equation editor for LaTeX equations.
%
% Syntax:
%    texStr = texed           % this generates the dialog/figure
%    texStr = texed(varargin) % appears to be for internal use only!
%
% Description:
%    TEXED is a graphical interface for editing and previewing LaTeX 
%    equations for use in MATLAB. Keyboard shortcuts and equation templates
%    are supported. TEXED is a fork of the MATLAB Central File Exchange
%    entry titled TeXEditor (FEX ID# 11946) by Ben Hinkle.  The main
%    difference between the two entries is the ability of this one to
%    return the TeX string that the user had crafted via the GUI, and the
%    unknown zip contents that were in a string in the extractFiles
%    function have been fully exposed.  JD GUI was used to expose the
%    source code of the TeXAction.class file.
%
% Inputs:
%     varargin - no documentation was present in the original entry. For
%     the most part varargin should be considered a place holder for
%     additional extensions to this tool.
%
% Output:
%     texStr = the last TeX string that was constructed prior to closing
%     the editor.
%
% Example:
%    texStr = texed
%    type into the first text box the following:
%     X_k=\frac{1}{N}\sum_{n=0}^{N-1}x_ne^{-i2\pi \frac{k}{N}n}
%    The equation will be rendered in the preview pane.
%    Clicking close will pass the TeX string that you just crafted into the
%    texStr varialbe.
%
% Bugs and suggestions:
%    Please send to jonathan lister (mechanical.engineer78 at gmail.com)
%
% Change log:
%    2013-07-11 initial re-release of texeditor as texed
%    2013-07-14 removed interal zip file and extraction routine
%
figs = allchild(0);
f = findall(figs,'flat','Type','figure','Tag','TexEdFigure'); %<-- so this is a trick to make a gui behave as a singleton?

%determine if texed is to return the TeX string and set flag.
outflg = false;
if nargout ==1
    varargout{1} = ''; 
    outflg = true;
end

if nargin > 0
    callbacks = getappdata(f,'Callbacks');
    feval(callbacks.cmdCB,varargin{:});
    return;
end

if ~isempty(f)
    set(f,'Visible','on');
    figure(f);
    return;
end

if ~usejava('swing')
    error('texed:NeedSwing','Equation editor requires Java Swing.');
end


% ---- this needs to be replaced -----
dirname = mfilename('fullpath');
% make sure Java .class and other helper files are on the path

%TeXAction.class is in zip file, source code is provided at the end of this
%file.

if ~exist(dirname,'dir') || isempty(which('TeXAction')) 
    javaaddpath(dirname);
    addpath(dirname);
end
% -------------------------------------

% make sure icons are on the path
back = get(0,'DefaultFigureColor');
set(f,'Color',back);
[addim,addcmap] = imread('move_down.gif'); % in zip file
addcmap(end,:) = back;
rolladdcmap = addcmap;
roll = back.*[.75 .75 1];
rolladdcmap(end,:) = roll;
[delim,delcmap] = imread('delete.gif'); % in zip file
delcmap(200:end,:) = repmat(back,size(delcmap,1)-199,1);
disdelcmap = delcmap;
disdelcmap(1:100,:) = repmat(back*.7,100,1);
rolldelcmap = delcmap;
rolldelcmap(200:end,:) = repmat(roll,size(delcmap,1)-199,1);

addbuth = []; % for callbacks
deletebuth = []; % for callbacks
f = figure('MenuBar','none','ToolBar','none',...
    'Name','Equation Editor',...
    'Tag','TexEdFigure',...
    'NumberTitle','off',...
    'HandleVisibility','callback',...
    'DeleteFcn',@deletecb,...
    'ResizeFcn',@layoutcb,...
    'Position',[0 0 450 350],...
    'Visible','off');

% read preferences or create defaults if none
if ispref('texed','ActionTable')
    actionTable = getpref('texed','ActionTable');
else
    actionTable = { ...
        % key, cmd
        '/','\frac{}{}';...
        'f','\frac{}{}';...
        's','\sum_{}^{}';...
        'p','\prod_{}^{}';...
        'i','\int_{}^{}';...
        'l','\lim_{ \to }';...
        'q','\sqrt{}';...
        'a','\alpha ';...
        'b','\beta ';...
        'g','\gamma ';...
        'd','\delta ';...
        'o','\overline{}';...
        'u','\underline{}';...
        't','\dot{}';...
        'h','\hat{}'...
        };
end
if ispref('texed','Templates')
    templates = getpref('texed','Templates');
else
    templates = {...
        'X_k=\frac{1}{N}\sum_{n=0}^{N-1}x_ne^{-j2\pi\frac{k}{N}n}',...
        '\alpha x_1^2 + \beta x_2^2',...
        '\sqrt{x+1}',...
        '\lim_{n \to \infty} \frac{1}{1+n}',...
        '\int_0^1 x \,dx',...
        '\sum_{n=0}^{\infty} \frac{1}{n^2}',...
        ['\left[ \begin{array}{cc}' char(10) ' A\ & B \\' ...
        char(10) ' C\ & D' char(10) '\end{array}\right]']...
        };
end

% spacing in pixels
bgap = 6;

left = 107;
bottom = 40;

% template buttons
buttonHeight = 48;
buttonWidth = 80;

% gui buttons
guiBW = 65;
guiBH = 25;

% make Preview pane
ax=axes('Units','pixels',...
    'XLim',[0 1],'YLim',[0 1],...
    'Layer','top',...
    'Parent',f,...
    'XTick',[],'YTick',[],'Box','on');
defaultFontSize = 20;
dt = text(.5,.9,'','Interpreter','latex',...
    'VerticalAlignment','top','HorizontalAlignment','center',...
    'FontSize',defaultFontSize,'Parent',ax);
errt = text(.5,.1,'','Interpreter','none',...
    'VerticalAlignment','bottom','HorizontalAlignment','center',...
    'FontSize',12,'Parent',ax);
setappdata(f,'lastKnownGoodString','');
setappdata(f,'lastEditedString','');

% make Java text pane - undocumented feature alert!
jc = com.mathworks.mwswing.MJTextPane;
try
    jfont = com.mathworks.hg.peer.FontConverter.convertToJavaFont('Courier',14,0,0);
catch %#ok<*CTCH>
    jfont = com.mathworks.hg.util.FontConverter.convertToJavaFont('Courier',14,0,0);
end
set(jc,'Font',jfont);
%[dummy,jch] = javacomponent(jc,[left+bgap .75 1-2*bgap-left .17].*pos,f);
[dummy,jch] = javacomponent(jc,[0 0 1 1],f);
jcc = handle(jc,'CallbackProperties');
set(jcc,'KeyTypedCallback',@typedCB)
set(jcc,'CaretUpdateCallback',@caretCB)
tabAct = TeXAction;
tabAct.putValue(javax.swing.Action.SHORT_DESCRIPTION,'Tab');
% hmm... this still will put a Tab character into the contents...
keymap = jc.getKeymap;
keymap.addActionForKeyStroke(...
    javax.swing.KeyStroke.getKeyStroke('released TAB'),tabAct);
setappdata(f,'Callbacks',jcc); % needed?

%todo: margin in scrollpane
jbp = com.mathworks.mwswing.MJPanel(com.mathworks.page.utils.VertFlowLayout);
jsp = com.mathworks.mwswing.MJScrollPane(jbp,javax.swing.ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,...
    javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
jsbar = jsp.getVerticalScrollBar;
set(jsp,'Font',jfont);
[dummy,jcompsp] = javacomponent(jsp,[0 0 1 1],f);

list = templates;
addbut = addIconButton('Add Template',addim,addcmap,...
    @addtmplcb,[],rolladdcmap);
[dummy,addbuth] = javacomponent(addbut,[0 0 1 1],f);
deletebut = addIconButton('Delete Template',delim,delcmap,...
    @deltmplcb,disdelcmap,rolldelcmap);
[dummy,deletebuth] = javacomponent(deletebut,[0 0 1 1],f);
setEnabled(deletebut,false);
miniax = axes('Units','pixels',...
    'XLim',[0 1],'YLim',[0 1],...
    'Layer','top','Visible','on',...
    'Parent',f,...
    'XTick',[],'YTick',[],'Box','off','Clipping','on',...
    'XColor',back,'YColor',back);
defaultMiniFontSize = 10;
minit = text(.5,.5,'','Interpreter','latex',...
    'VerticalAlignment','middle','HorizontalAlignment','center',...
    'FontSize',defaultMiniFontSize,'Clipping','on',...
    'HitTest','off','Parent',miniax);
set(miniax,'ButtonDownFcn',@lastbutcb);
set(f,'WindowButtonMotionFcn',@mousemovecb);

scutbut = uicontrol('style','pushbutton',...
    'String','Shortcuts',...
    'Parent',f,...
    'Callback',@shortcutscb);
symsbut = uicontrol('style','pushbutton',...
    'String','Symbols',...
    'Parent',f,...
    'Callback',@symbolscb);
helpbut = uicontrol('style','pushbutton',...
    'String','Help',...
    'Parent',f,...
    'Callback',@helpcb);
closebut = uicontrol('style','pushbutton',...
    'String','Close',...
    'Parent',f,...
    'Callback',@closecb);

movegui(f,'center');
set(f,'visible','on')
tim = timer('timerfcn',@dotimer,'startdelay',1,'executionmode','singleshot');
setappdata(f,'Callbacks',struct('cmdCB',@cmdCB));
doLayout;
drawnow;
pause(.5);
for k1=length(list):-1:1
    addTemplate(jbp,list{k1},[]);
end
jc.requestFocus;
uiwait(f)

    function doLayout
        pos = get(f,'Position');
        origpos = pos;
        if pos(3) < 120
            pos(3) = 120;
        end
        if pos(4) < 150
            pos(4) = 150;
        end
        if ~isequal(pos,origpos)
            set(f,'Position',pos);
        end
        width = pos(3)-2*bgap-left;
        height = pos(4)-bottom-2*bgap;
        ratio = .6;
        set(ax,'Position',[left+bgap bottom+bgap width ratio*height]);
        axtop = bottom+bgap+ratio*height;
        set(jch,'Position',[left+bgap axtop+bgap width (1-ratio)*height-bgap]);
        is = 24;
        scrolltop = pos(4)-buttonHeight-4*bgap-is;
        set(addbuth,'Position',[left/2-bgap-is scrolltop+bgap is is]);
        set(deletebuth,'Position',[left/2+bgap scrolltop+bgap is is]);
        set(miniax,'Position',[left/2-buttonWidth/2 scrolltop+2*bgap+is ...
            buttonWidth buttonHeight]);
        set(jcompsp,'Position',...
            [bgap bottom+bgap left-bgap scrolltop-bottom-bgap]);
        w = guiBW+bgap;
        w0 = left+bgap;
        set(scutbut,'Position',[w0 bgap guiBW guiBH]);
        set(symsbut,'Position',[w0+w bgap guiBW guiBH]);
        set(helpbut,'Position',[w0+2*w bgap guiBW guiBH]);
        set(closebut,'Position',[w0+3*w bgap guiBW guiBH]);
        fitEqnToAxes(dt,defaultFontSize);
    end

    function layoutcb(src,ev) %#ok
        doLayout;
    end

    function cmdCB(name)
        name(name == ' ') = [];
        switch name
            case char(9)
                doAction(true,char(9));
        end
        jc.requestFocus;
    end

    function typedCB(hSrc,evdata) %#ok
        % if anything other than shift, return
        iscmd = false;
        ch = get(evdata,'KeyChar');
        if bitand(get(evdata,'modifiers'),8)
            iscmd = true;
        elseif get(evdata,'modifiers') > 1
            return
        end
        doAction(iscmd,ch);
    end

    function caretCB(hSrc,evdata) %#ok
        dot = evdata.getDot;
        mark = evdata.getMark;
        if dot == mark
            % draw caret
        else
            % highlight region
        end
    end

    function str = doCmd(ch,str)
        selStart = jc.getSelectionStart()+1;
        selEnd = jc.getSelectionEnd()+1;
        if strcmp(ch,'n') || strcmp(ch,char(9))
            if strcmp(ch,char(9))
                
            end
            % skip to next bracket
            inds = find(str=='}' | str=='{' | str==')' | str=='(');
            next = inds(inds >= selEnd);
            if ~isempty(next)
                next = next(1);
                if strncmp(str(next:end),'}{',2)
                    jc.setCaretPosition(next+1);
                elseif strncmp(str(next:end),'}_{',3) || ...
                        strncmp(str(next:end),'}^{',3)
                    jc.setCaretPosition(next+2);
                else
                    jc.setCaretPosition(next);
                end
            else
                jc.setCaretPosition(length(str));
            end
        else
            if isappdata(f,'ActionTable');
                actionTable = getappdata(f,'ActionTable');
            end
            for kk=1:length(actionTable)
                action = actionTable(kk,:);
                if strcmp(ch,action{1})
                    cmdTemplate = action{2};
                    inds = find(cmdTemplate=='{');
                    if isempty(inds)
                        inds=length(cmdTemplate);
                    end
                    cmd = cmdTemplate(1:inds(1));
                    cmdEnd = cmdTemplate(inds(1)+1:end);
                    str = [str(1:selStart-1) cmd str(selStart:selEnd-1) ...
                        cmdEnd str(selEnd:end)];
                    doc = jc.getDocument;
                    doc.insertString(selEnd-1,cmdEnd,[]);
                    doc.insertString(selStart-1,cmd,[]);
                    if (selEnd - selStart > 0) && length(inds)>1
                        jc.setCaretPosition(selEnd+inds(2)-1);
                    else
                        jc.setCaretPosition(selStart+length(cmd)-1);
                    end
                end
            end
        end
        awtinvoke(deletebut,'setEnabled(Z)',false);
    end

    function doAction(iscmd,ch)
        str = get(jc,'Text');
        if iscmd
            str = doCmd(ch,str);
        end
        orig_str = str;
        str(str == 10) = ' ';
        % instead of ripping out tabs instead modify keymap
        tabs = find(str == char(9));
        if ~isempty(tabs)
            jc.setSelectionStart(tabs(1)-1);
            jc.setSelectionEnd(tabs(1));
            jc.replaceSelection('');
        end
        selStart = jc.getSelectionStart()+1;
        selEnd = jc.getSelectionEnd()+1;
        if selStart == selEnd
            % draw single caret
        else
            % highlight selected construct
        end
        %ind = jc.getCaretPosition;
        %str = [str(1:ind) '\vrule{}' str(ind+1:end)];
        str = ['$$ ' str '$$'];
        [dvi,err] = tex(str); %#ok
        if isempty(err)
            set(dt,'String',str);
            fitEqnToAxes(dt,defaultFontSize);
            set(minit,'String',str);
            fitEqnToAxes(minit,defaultMiniFontSize);
            setappdata(f,'lastKnownGoodString',orig_str);
            setappdata(f,'lastEditedString',orig_str);
            stop(tim);
            set(dt,'Color',[0 0 0]);
            set(errt,'String','');
        else
            if tim.running, stop(tim); end
            start(tim);
            
            % todo: error message from tex now only says "Invalid LaTeX string". Wait
            % until something better comes on line.
            %            set(errt,'string',err);
        end
        awtinvoke(deletebut,'setEnabled(Z)',false);
    end

    function fitEqnToAxes(t,defaultFontSize)
        fsize = defaultFontSize;
        set(t,'FontSize',fsize);
        ex = get(t,'Extent');
        if ex(3) > 1
            fsize = fsize/ex(3);
            set(t,'FontSize',fsize);
        end
        ex = get(t,'Extent');
        if ex(4) > 1
            fsize = fsize/ex(4);
            set(t,'FontSize',fsize);
        end
    end

    function button = addIconButton(str,data,cmap,cb,discmap,rollcmap)
        [m,n]=size(data);
        pdata = ones(m+8,n+8,'uint8');
        pdata(:,:) = data(1,1);
        pdata(5:4+m,5:4+n) = data;
        jdata = im2java(pdata,cmap);
        icon = javax.swing.ImageIcon(jdata);
        button = com.mathworks.mwswing.MJButton(icon);
        
        if ~isempty(discmap) % set disabled icon
            ddata = im2java(pdata,discmap);
            icon = javax.swing.ImageIcon(ddata);
            button.setDisabledIcon(icon);
        end
        
        button.setSize(java.awt.Dimension(24,24));
        button.setBorder([]);
        button.setToolTipText(str);
        button.setRolloverEnabled(true);
        
        pdata(1,:) = 0;
        pdata(end,:) = 0;
        pdata(:,1) = 0;
        pdata(:,end) = 0;
        jdata = im2java(pdata,rollcmap);
        icon2 = javax.swing.ImageIcon(jdata);
        button.setRolloverIcon(icon2);
        
        buttoncb = handle(button,'CallbackProperties');
        set(buttoncb,'ActionPerformedCallback',cb);
    end

    function addtmplcb(src,ev) %#ok
        str = getappdata(f,'lastEditedString');
        im = getframe(miniax);
        addTemplate(jbp,str,im);
        awtinvoke(deletebut,'setEnabled(Z)',false);
        awtinvoke(jc,'requestFocus()');
    end

    function deltmplcb(src,ev) %#ok
        str=char(get(jc,'Text'));
        templ = getappdata(f,'Templates');
        found = 0;
        for k=1:length(templ)
            t = templ{k};
            if strcmp(t,str)
                found = k;
            end
        end
        if found > 0
            templ(found) = [];
            awtinvoke(jbp,'remove(I)',found-1);
            awtinvoke(jsbar,'validate()');
            awtinvoke(jsp,'validate()');
            drawnow;
            setappdata(f,'Templates',templ);
        end
        awtinvoke(deletebut,'setEnabled(Z)',false);
    end

    function symbolscb(src,ev) %#ok
        web('http://omega.albany.edu:8008/Symbols.html')
    end

    function helpcb(src,ev) %#ok
        web('http://meta.wikimedia.org/wiki/Help:Formula');
    end

    function closecb(src,ev) %#ok
        if outflg
            varargout{1} = jc.getText();
        end
        sfig = getappdata(f,'ShortcutDialog');
        if ~isempty(sfig) && ishandle(sfig)
            delete(sfig);
        end
        deletecb([],[]);
        delete(f);
    end

    function deletecb(src,ev) %#ok
        if isappdata(f,'ActionTable')
            actionTable = getappdata(f,'ActionTable');
            setpref('texed','ActionTable',actionTable);
        end
        if isappdata(f,'Templates')
            templates = getappdata(f,'Templates');
            setpref('texed','Templates',templates);
        end
        delete(tim);
    end

    function dotimer(src,ev) %#ok
        set(dt,'color',[.6 .6 .6]);
    end

    function im = generateIcon(eqn)
        p_eqn = ['$$' eqn '$$'];
        p_eqn(p_eqn==10) = ' ';
        if isempty(p_eqn), p_eqn = ' '; end
        oldstr = get(minit,'String');
        set(minit,'String',p_eqn);
        fitEqnToAxes(minit,defaultMiniFontSize);
        drawnow;
        im = getframe(miniax);
        set(minit,'String',oldstr);
    end

    function addTemplate(jp,eqn,im)
        if isempty(im)
            im = generateIcon(eqn);
        end
        icon = javax.swing.ImageIcon(im2java(im.cdata));
        button = com.mathworks.mwswing.MJButton(icon);
        button.setBorder([]);
        zeroinset = java.awt.Insets(0,0,0,0);
        button.setMargin(zeroinset);
        data2 = im.cdata;
        data2(1,:,:) = 1;
        data2(end,:,:) = 1;
        data2(:,1,:) = 1;
        data2(:,end,:) = 1;
        icon = javax.swing.ImageIcon(im2java(data2));
        button.setRolloverIcon(icon);
        templates = getappdata(f,'Templates');
        if isempty(templates)
            templates = {};
        end
        %templates = {eqn,templates{:}};
        templates = [{eqn} templates];
        buttoncb = handle(button,'CallbackProperties');
        set(buttoncb,'ActionPerformedCallback',{@templatecb,eqn});
        setappdata(f,'Templates',templates)
        awtinvoke(jp,'add(Ljava.awt.Component;I)',button,0);
        awtinvoke(jsp,'validate()');
        awtinvoke(jsbar,'setValue(I)',0);
        drawnow;
    end

    function templatecb(src,ev,eqn) %#ok
        awtinvoke(jc,'setText',java.lang.String(eqn))
        setappdata(f,'lastKnownGoodString',eqn);
        setMainText(eqn);
        set(dt,'color',[0 0 0]);
        set(errt,'string','');
        awtinvoke(deletebut,'setEnabled(Z)',true);
    end

    function mousemovecb(src,ev) %#ok
        pt = get(f,'CurrentPoint');
        ppos = get(miniax,'Position');
        if pt(1) > ppos(1) && pt(2) > ppos(2) && ...
                pt(1) < ppos(1)+ppos(3) && pt(2) < ppos(2)+ppos(4)
            set(miniax,'Box','on');
            set(miniax,'XColor','black','YColor','black');
        else
            set(miniax,'Box','off');
            set(miniax,'XColor',back,'YColor',back);
        end
    end

    function setMainText(eqn)
        eqn(eqn==10)=' ';
        if isempty(eqn), eqn = ' '; end
        set(dt,'string',['$$' eqn '$$']);
        fitEqnToAxes(dt,defaultFontSize);
    end

    function lastbutcb(src,ev) %#ok
        eqn = getappdata(f,'lastEditedString');
        if isempty(eqn), eqn = ' '; end
        awtinvoke(jc,'setText',java.lang.String(eqn))
        setMainText(eqn);
        set(dt,'color',[0 0 0]);
        set(errt,'string','');
        awtinvoke(deletebut,'setEnabled(Z)',false);
    end

    function shortcutscb(src,ev) %#ok
        sfig = findobj('Type','figure','Tag','TexEdFigureShortcuts');
        if isempty(sfig)
            sfig = createShortcutsDialog;
            setappdata(f,'ShortcutDialog',sfig);
            doShortcutLayout;
        end
        set(sfig,'Visible','on');
        figure(sfig);
    end

    function sfig = createShortcutsDialog
        pos = get(f,'Position');
        h = max(420,pos(4));
        w = 200;
        screen = get(0,'ScreenSize');
        l = min(pos(1)+pos(3)+10,screen(3)-w-10);
        sfig = figure('Position',[l pos(2)+pos(4)-h w h],...
            'ToolBar','none',...
            'MenuBar','none',...
            'NumberTitle','off',...
            'Name','TeX Shortcut Editor',...
            'ResizeFcn',@doShortcutLayoutcb);
        str = '<html><a href="none">What is a TeX shortcut?</a>';
        swhatis = com.mathworks.mwswing.MJButton(str);
        swhatis.setBorder([]);
        c = single(back);
        color = java.awt.Color(c(1),c(2),c(3));
        swhatis.setBackground(color);
        cursor = java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR);
        swhatis.setCursor(cursor);
        [dummy,swhatisj] = javacomponent(swhatis,[0 0 1 1],sfig); %#ok
        buttoncb = handle(swhatis,'CallbackProperties');
        set(buttoncb,'ActionPerformedCallback',@shorthelp);
        
        
        sapplybut = uicontrol('style','pushbutton',...
            'String','Apply',...
            'Callback',@shortapplycb);
        sclosebut = uicontrol('style','pushbutton',...
            'String','Close',...
            'Callback',@shortclosecb);
        snewbut = uicontrol('style','pushbutton',...
            'String','New',...
            'Callback',@shortnewcb);
        sdelbut = uicontrol('style','pushbutton',...
            'String','Delete',...
            'Enable','off',...
            'Callback',@shortdeletecb);
        
        % create Table model and populate it with the default shortcuts
        tm = javax.swing.table.DefaultTableModel;
        tm.setColumnCount(2);
        tm.setColumnIdentifiers({'Key','Text'})
        len = size(actionTable,1);
        tm.setRowCount(len);
        for k=1:len
            tm.setValueAt(java.lang.String(actionTable{k,1}),k-1,0);
            tm.setValueAt(java.lang.String(actionTable{k,2}),k-1,1);
        end
        table = javax.swing.JTable(tm);
        table.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_OFF);
        cmod = table.getColumnModel;
        col = cmod.getColumn(0);
        col.setPreferredWidth(30);
        col.setResizable(false);
        
        % add selection listener
        rowSM = table.getSelectionModel;
        selcb = handle(rowSM,'CallbackProperties');
        set(selcb,'valueChangedCallback',@shortselectcb);
        
        
        % set column widths and put the table in a scrollpane
        jsp2 = com.mathworks.mwswing.MJScrollPane(table,javax.swing.ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS,...
            javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        set(jsp2,'Font',jfont);
        [dummy,jcompsp2] = javacomponent(jsp2,[0 0 1 1],sfig);
        objs.table = table;
        objs.scroll = jsp2;
        objs.model = tm;
        objs.mscroll = jcompsp2;
        objs.sapplybut = sapplybut;
        objs.sclosebut = sclosebut;
        objs.swhatisj = swhatisj;
        objs.snewbut = snewbut;
        objs.sdeletebut = sdelbut;
        objs.selmodel = rowSM;
        setappdata(sfig,'shortcutDialogObjs',objs);
    end

    function doShortcutLayout
        sfig = getappdata(f,'ShortcutDialog');
        objs = getappdata(sfig,'shortcutDialogObjs');
        pos = get(sfig,'Position');
        set(objs.mscroll,'Position',[5 40 pos(3)-10 pos(4)-70-35]);
        
        % try Spreadsheet in com.mathworks!!
        cmod = objs.table.getColumnModel;
        col = cmod.getColumn(1);
        vp = objs.scroll.getViewport;
        tsize = vp.getSize;
        col.setPreferredWidth(tsize.width-30);
        set(objs.sapplybut,'Position',[pos(3)-10-2*guiBW 5 guiBW guiBH]);
        set(objs.sclosebut,'Position',[pos(3)-5-guiBW 5 guiBW guiBH]);
        set(objs.snewbut,'Position',[5 pos(4)-25-35 guiBW guiBH]);
        set(objs.sdeletebut,'Position',[10+guiBW pos(4)-25-35 guiBW guiBH]);
        set(objs.swhatisj,'Position',[5 pos(4)-20-5 125 20]);
    end

    function shorthelp(src,ev) %#ok
        str0 = 'A TeX shortcut inserts text when you hit a key.';
        str1 = ['In the equation editor '...
            'holding the Alt key while hitting a key from ' ...
            'the left column (Key) will insert the text from the '...
            'right column (Text).'];
        str2 = 'Hitting Tab will move the cursor to the next brace {.';
        h = msgbox({str0,str1,str2},'What is a TeX shortcut?','modal');
        %    sfig = getappdata(f,'ShortcutDialog');
        %    pos = get(sfig,'Position');
        %    center = pos(1:2)+pos(3:4)/2;
        %    hpos = get(h,'Position');
        %    set(h,'Position',[center-hpos(3:4)/2 hpos(3:4)])
        uiwait(h);
    end

    function shortnewcb(src,ev) %#ok
        sfig = getappdata(f,'ShortcutDialog');
        objs = getappdata(sfig,'shortcutDialogObjs');
        tm = objs.model;
        tm.addRow({'',''});
    end

    function shortselectcb(src,ev) %#ok
        sfig = getappdata(f,'ShortcutDialog');
        objs = getappdata(sfig,'shortcutDialogObjs');
        if (ev.getValueIsAdjusting), return; end
        if objs.selmodel.isSelectionEmpty
            set(objs.sdeletebut,'Enable','off')
        else
            set(objs.sdeletebut,'Enable','on')
        end
    end

    function shortdeletecb(src,ev) %#ok
        sfig = getappdata(f,'ShortcutDialog');
        objs = getappdata(sfig,'shortcutDialogObjs');
        row = objs.table.getSelectedRow;
        while (row ~= -1)
            objs.model.removeRow(row);
            row = objs.table.getSelectedRow;
        end
    end

    function shortapplycb(src,ev) %#ok
        sfig = getappdata(f,'ShortcutDialog');
        objs = getappdata(sfig,'shortcutDialogObjs');
        tm = objs.model;
        count = tm.getRowCount;
        actions = cell(count,2);
        ok = true(count,1);
        for k=1:count
            key = char(tm.getValueAt(k-1,0));
            if isempty(key)
                warning('texed:EmptyKey','Ignoring empty Key shortcut.');
                ok(k) = false;
            else
                if length(key) > 1
                    warning('texed:MultiCharKey',...
                        ['Keys can only be a single character.'...
                        'Ignoring extra characters.']);
                    key = key(1);
                end
                action = char(tm.getValueAt(k-1,1));
                actions{k,1} = key;
                actions{k,2} = action;
            end
        end
        actions = actions(ok,:);
        setappdata(f,'ActionTable',actions);
        
    end

    function shortclosecb(src,ev) %#ok
        delete(gcbf);
    end

    function doShortcutLayoutcb(src,ev) %#ok
        doShortcutLayout;
    end
end
