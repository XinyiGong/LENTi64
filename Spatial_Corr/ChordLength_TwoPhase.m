
function [hist,edgeFraction]=ChordLength_TwoPhase(data)
%clear all

%data=read_dump('dump.additive4.3', [1024 1024 1024]);

histx1=zeros(1024,1);
histy1=zeros(1024,1);
histx2=zeros(1024,1);
histy2=zeros(1024,1);

edgex1=zeros(1024,1);
edgey1=zeros(1024,1);
edgex2=zeros(1024,1);
edgey2=zeros(1024,1);

% x direction


    for j=1:1024
        flag=0;
        count1=1;
        count2=1;%%
        
        for k=2:1024
            
            if flag==0 
                if data(k,j)~=data(k-1,j)
                    flag=1; %"first "boundary"
                    if data(k-1,j) == 1%%
                        edgex1(count1,1)=edgex1(count1,1)+1;%%
                        count1=1;%%
                    else
                        edgex2(count2,1)=edgex2(count2,1)+1;%%
                        count2=1;%%
                    end%%
                elseif k==1024
                    if data(k-1,j) == 1%%
                        count1=count1+1;%%
                        edgex1(count1,1)=edgex1(count1,1)+1;%%
                    else
                        count2=count2+1;%%
                        edgex2(count2,1)=edgex2(count2,1)+1;%%
                    end
                else
                    if data(k-1,j) == 1%%
                        count1=count1+1;%%
                    else%%
                        count2=count2+1;%%
                    end%%
                end
            else %flag=1
                if (data(k,j)~=data(k-1,j) && k<1024)
                    if data(k-1,j) == 1
                        histx1(count1,1)=histx1(count1,1)+1;
                        count1=1;
                    else
                        histx2(count2,1)=histx2(count2,1)+1;
                        count2=1;
                    end
                elseif k==1024
                    if data(k,j)~=data(k-1,j)
                        if data(k-1,j) == 1
                            histx1(count1,1)=histx1(count1,1)+1;
                            count1=1;
                            edgex2(1,1)=edgex2(1,1)+1;
                        else
                            histx2(count2,1)=histx2(count2,1)+1;
                            count2=1;
                            edgex1(1,1)=edgex1(1,1)+1;
                        end
                    else
                        if data(k-1,j) == 1
                            count1=count1+1;
                            edgex1(count1,1)=edgex1(count1,1)+1;
                        else
                            count2=count2+1;
                            edgex2(count2,1)=edgex2(count2,1)+1;
                        end
                    end
                else
                    if data(k-1,j) == 1
                        count1=count1+1;
                    else
                        count2=count2+1;
                    end
                end
            end
        end
    end


%y direction


    for j=1:1024
        flag=0;
        count1=1;
        count2=1;%%
        
        for k=2:1024
            
            if flag==0 
                if data(j,k)~=data(j,k-1)
                    flag=1; %"first "boundary"
                    if data(j,k-1)==1
                        edgey1(count1,1)=edgey1(count1,1)+1;
                        count1=1;
                    else
                        edgey2(count2,1)=edgey2(count2,1)+1;
                        count2=1;
                    end
                elseif k==1024
                    if data(j,k-1)==1
                        count1=count1+1;
                        edgey1(count1,1)=edgey1(count1,1)+1;
                    else
                        count2=count2+1;
                        histy2(count2,1)=histy2(count2,1)+1;
                    end
                else
                    if data(j,k-1)==1
                        count1=count1+1;
                    else
                        count2=count2+1;
                    end
                end
            else %flag=1
                if (data(j,k)~=data(j,k-1) && k<1024)
                    if data(j,k-1)==1
                        histy1(count1,1)=histy1(count1,1)+1;
                        count1=1;
                    else
                        histy2(count2,1)=histy2(count2,1)+1;
                        count2=1;
                    end
                elseif k==1024
                    if data(j,k)~=data(j,k-1)
                        if data(j,k-1)==1
                            histy1(count1,1)=histy1(count1,1)+1;
                            count1=1;
                            edgey2(1,1)=edgey2(1,1)+1;
                        else
                            histy2(count2,1)=histy2(count2,1)+1;
                            count2=1;
                            edgey1(1,1)=edgey1(1,1)+1;
                        end
                    else
                        if data(j,k-1)==1
                            count1=count1+1;
                            edgey1(count1,1)=edgey1(count1,1)+1;
                        else
                            count2=count2+1;
                            edgey2(count2,1)=edgey2(count2,1)+1;
                        end
                    end
                else
                    if data(j,k-1)==1
                        count1=count1+1;
                    else
                        count2=count2+1;
                    end
                end
            end
        end
    end




num=[1:1024]';


edgex1=edgex1.*num;
edgey1=edgey1.*num;
edgez1=edgez1.*num;
edgex2=edgex2.*num;
edgey2=edgey2.*num;
edgez2=edgez2.*num;

histx1=histx1.*num;
histy1=histy1.*num;
histz1=histz1.*num;
histx2=histx2.*num;
histy2=histy2.*num;
histz2=histz2.*num;

edgex = [edgex1;edgex2];
edgey = [edgey1;edgey2];
edgez = [edgez1;edgez2];
histx = [histx1;histx2];
histy = [histy1;histy2];
histz = [histz1;histz2];

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



