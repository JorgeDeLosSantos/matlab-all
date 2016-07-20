function scrollfun

f = figure('MenuBar','none','WindowScrollWheelFcn',@movscroll,'Name','Scroll Wheel Demo');
   x = [0:.1:20];
   y = exp(-x/10).*cos(x);
   a = axes; 
   h = plot(x,y);
   title('Rota el scroll del mouse')
   function movscroll(src,evnt)
      if evnt.VerticalScrollCount > 0 
         xd = get(h,'XData');
         inc = xd(end)/20;
         x = [0:.1:xd(end)+inc];
         redibujar(x)
      elseif evnt.VerticalScrollCount < 0 
         xd = get(h,'XData');
         inc = xd(end)/20;
         x = [0:.1:xd(end)-inc+.1];
         redibujar(x)
      end
   end

   function redibujar(x)
      y = exp(-x/10).*cos(x);
      set(h,'YData',y,'XData',x)
      set(a,'XLim',[0 x(end)])
      drawnow
   end

end