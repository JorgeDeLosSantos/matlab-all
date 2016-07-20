import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.File;

rb = Robot;
p=get(0,'ScreenSize');
rect=Rectangle(p(3),p(4));
A=rb.createScreenCapture(rect);
ImageIO.write(A,'png',File([cd,'\img.png']));
% close all;clear all;clc;