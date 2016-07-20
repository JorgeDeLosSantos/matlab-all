import com.mathworks.jmi.MatlabMCR;
import java.awt.event.ActionEvent;
import javax.swing.AbstractAction;

class TeXAction extends AbstractAction
{
  MatlabMCR matlab = new MatlabMCR();

  public TeXAction() {  } 
  public TeXAction(String paramString) { super(paramString); }

  public void actionPerformed(ActionEvent paramActionEvent) {
    Object[] arrayOfObject = { paramActionEvent.getActionCommand() };
    this.matlab.fevalConsoleOutput("texeditor", arrayOfObject);
  }
}
