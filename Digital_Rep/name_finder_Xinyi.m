filepath1=['C:\Users\xgong42\Documents\some_SPPARKS_folders\T5-X-V2-5-\W60\D100\L50\HAZ20'];
dumplevel=dir(filepath1);
dumplevelsize=StructSize(dumplevel);
for m=1:dumplevelsize
    a=strfind(dumplevel(m).name,'dump.additive');
    a=size(a);
    if a(1)==0
        continue;
    end
    b=strfind(dumplevel(m).name,'gz');
    b=size(b);
    if b(1)==1
        continue;
    end
    disp([filepath1,dumplevel(m).name]);
    break;
end
