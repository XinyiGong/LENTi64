

for i = 1:size(powerfit,2)
    fit(i,1) = powerfit(i).curvefit.a;
    fit(i,2) = powerfit(i).curvefit.b;
    fit(i,3) = powerfit(i).curvefit.c;
end
