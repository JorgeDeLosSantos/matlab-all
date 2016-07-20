close all;clear all;clc;
import java.lang.*;
import javax.swing.*;
import java.awt.*;

P=javax.swing.JFrame('GUI APP JAVA');
%img = javax.swing.ImageIcon('inicio.png');
col = java.awt.Color.RED;
P.setBackground(col);
% P.setLocationRelativeTo();
% P.setIconImages(img);
P.setSize(200,200);
P.setVisible(1);
P.setLayout(java.awt.FlowLayout);
et=javax.swing.JLabel('Etiqueta');
bt=javax.swing.JButton('This');
P.add(et);
P.add(bt);

