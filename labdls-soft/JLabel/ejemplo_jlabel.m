import javax.swing.ImageIcon

f=figure('MenuBar','none',...
    'Resize','off',...
    'Position',[0 0 200 100]);
centerfig();

[hJLabel,hPw]=javacomponent({'javax.swing.JLabel'},[],f);
hJLabel.setBackground(100,200,100);
set(hPw,'Position',[40 60 32 32]);