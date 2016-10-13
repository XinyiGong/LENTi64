index = [15 30 40 50 60 65];
for p = 1:6
    data = importdata([num2str(index(p)),'pctalpha_avgstrs_strn_output.txt']);
    if isstruct(data)
        x = data.data(:,1);
        y = data.data(:,3);
    else
        x = data(:,1);
        y = data(:,3);
    end
    voce = fittype('a+b*(1-exp(-c*x))',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a','b','c'});
    [curvefit,gof,output] = fit(x,y,voce);
    vocefit(p).name = [num2str(index(p)),'pctalpha'];
    vocefit(p).curvefit = curvefit;
    vocefit(p).gof = gof;
    vocefit(p).output = output;
    
    
    [curvefit,gof,output] = fit(x,y,'power2');
    powerfit(p).name = [num2str(index(p)),'pctalpha'];
    powerfit(p).curvefit = curvefit;
    powerfit(p).gof = gof;
    powerfit(p).output = output;
end

save('fit','vocefit','powerfit');