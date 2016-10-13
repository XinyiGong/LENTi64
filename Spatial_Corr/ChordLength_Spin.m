
function [hist,edgeFraction]=ChordLength_Spin(data)
%clear all

%data=read_dump('dump.additive4.3', [225 225 225]);

histx=zeros(225,1);
histy=zeros(225,1);
histz=zeros(225,1);

edgex=zeros(225,1);
edgey=zeros(225,1);
edgez=zeros(225,1);

% x direction

for i=1:225
    for j=1:225
        flag=0;
        count=1;
        
        for k=2:225
            
            if flag==0 
                if data(k,j,i)~=data(k-1,j,i)
                    flag=1; %"first "boundary"
                    edgex(count,1)=edgex(count,1)+1;
                    count=1;
                elseif k==225
                    count=count+1;
                    histx(count,1)=histx(count,1)+1;
                else
                    count=count+1;
                end
            else %flag=1
                if (data(k,j,i)~=data(k-1,j,i) && k<225)
                histx(count,1)=histx(count,1)+1;
                count=1;
                elseif k==225
                    if data(k,j,i)~=data(k-1,j,i)
                        histx(count,1)=histx(count,1)+1;
                        count=1;
                        edgex(1,1)=edgex(1,1)+1;
                    else
                        count=count+1;
                        edgex(count,1)=edgex(count,1)+1;
                    end
                else
                count=count+1;
                end
            end
        end
    end
end

%y direction

for i=1:225
    for j=1:225
        flag=0;
        count=1;
        
        for k=2:225
            
            if flag==0 
                if data(j,k,i)~=data(j,k-1,i)
                    flag=1; %"first "boundary"
                    edgey(count,1)=edgey(count,1)+1;
                    count=1;
                elseif k==225
                    count=count+1;
                    histy(count,1)=histy(count,1)+1;
                else
                    count=count+1;
                end
            else %flag=1
                if (data(j,k,i)~=data(j,k-1,i) && k<225)
                histy(count,1)=histy(count,1)+1;
                count=1;
                elseif k==225
                    if data(j,k,i)~=data(j,k-1,i)
                        histy(count,1)=histy(count,1)+1;
                        count=1;
                        edgey(1,1)=edgey(1,1)+1;
                    else
                        count=count+1;
                        edgey(count,1)=edgey(count,1)+1;
                    end
                else
                count=count+1;
                end
            end
        end
    end
end

% z direction

for i=1:225
    for j=1:225
        flag=0;
        count=1;
        
        for k=2:225
            
            if flag==0 
                if data(i,j,k-1)~=data(i,j,k)
                    flag=1; %"first "boundary"
                    edgez(count,1)=edgez(count,1)+1;
                    count=1;
                elseif k==225
                    count=count+1;
                    histz(count,1)=histz(count,1)+1;
                else
                    count=count+1;
                end
            else %flag=1
                if (data(i,j,k-1)~=data(i,j,k) && k<225)
                histz(count,1)=histz(count,1)+1;
                count=1;
                elseif k==225
                    if data(i,j,k-1)~=data(i,j,k)
                        histz(count,1)=histz(count,1)+1;
                        count=1;
                        edgez(1,1)=edgez(1,1)+1;
                    else
                        count=count+1;
                        edgez(count,1)=edgez(count,1)+1;
                    end
                else
                count=count+1;
                end
            end
        end
    end
end

num=[1:225]';


edgex=edgex.*num;
edgey=edgey.*num;
edgez=edgez.*num;

histx=histx.*num;
histy=histy.*num;
histz=histz.*num;

histxE=edgex+histx;
histyE=edgey+histy;
histzE=edgez+histz;

histxE=sum(edgex)/sum(histxE,1);
histyE=sum(edgey)/sum(histyE,1);
histzE=sum(edgez)/sum(histzE,1);

histx=histx./sum(histx,1);
histy=histy./sum(histy,1);
histz=histz./sum(histz,1);


hist=[histx histy histz];
edgeFraction=[histxE histyE histzE];



