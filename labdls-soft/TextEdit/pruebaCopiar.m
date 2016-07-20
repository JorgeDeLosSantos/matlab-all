clear all;clc;
import java.awt.Robot;
import java.awt.event.KeyEvent;
rb=Robot();
rb.keyPress(KeyEvent.VK_CONTROL);
rb.keyPress(KeyEvent.VK_C);
rb.keyRelease(KeyEvent.VK_CONTROL);
rb.keyRelease(KeyEvent.VK_C);
