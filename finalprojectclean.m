function [] = finalprojectclean() 
global conversion;

conversion.fig = figure('numbertitle','off','name','Flux Converstion Calculator'); %GUI title
conversion.inputValueMessage = uicontrol('style','text','units','normalized','position',[.3 .88 .3 .095], 'string', 'Dynamic Viscocity (kg/m*s)','horizontalalignment','right'); %Calculator title
conversion.inputBox = uicontrol('style', 'edit', 'units', 'normalized', 'position',[.33 .83 .30 .05], 'string', 'Type Given Value Here'); %Edit Box with letters in it

conversion.radioButton = uibuttongroup('visible','on','unit','normalized','position',[.4 .52 .15 .2],'selectionchangefcn',(@radioselect)); %Radio button outter box
conversion.radioButton1 = uicontrol(conversion.radioButton,'style','radiobutton','units','normalized','position',[.1 .6 1 .2] , 'handleVisibility','off','string','lbm/ft*h');%radio button for 1
conversion.radioButton2 = uicontrol(conversion.radioButton,'style','radiobutton','units','normalized','position',[.1 .4 1 .2] , 'handleVisibility','off','string','lbm/ft*s');%radio button for 2

conversion.conversionWithSeconds(1) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.11 .35 .30 .05], 'string', 'EXECUTE HOURS', 'callback', @Flux1); %pushbutton hours
conversion.conversionWithHours(2) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.55 .35 .30 .05], 'string', 'EXECUTE SECONDS', 'callback', @Flux2); %pushbutton seconds

conversion.newValue(1) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.185 .3 .15 .05],'string', 'Converted Value', 'horizontalalignment', 'right'); %Displays "Converted Value" 1
conversion.newValue(2) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.625 .3 .15 .05],'string', 'Converted Value', 'horizontalalignment', 'right'); %Displays "Converted Value" 2

conversion.output(1) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.18 .25 .1 .06], 'string',num2str(conversion.hfluxlbh), 'horizontalalignment','right'); %output of conversion 1
conversion.output(2) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.625 .25 .08 .06], 'string',num2str(conversion.hfluxlbs), 'horizontalalignment','right'); %output of conversion 2
    
        function [] = radioButtons(~,~)

    end
   

    function [hfluxlbh] = Flux1(~,~) 
          hflux = get(conversion.inputBox,'string'); %string to num for 1
        conversion.hfluxlbh = num2str(hflux*2419.1); %eqn for hours
       
        conversion.output(1).String = num2str(conversion.hfluxlbh) %sends this eqns answer up to output
    end
    function [hfluxlbs] = Flux2(~,~)
        
         hflux = get(conversion.inputBox,'string'); %string to num for 2
         conversion.hfluxlbs = num2str(hflux *0.67197); %eqn for seconds

         conversion.output(2).String = num2str(conversion.hfluxlbs)%sends this eqns answer up to output(2)
    end
end