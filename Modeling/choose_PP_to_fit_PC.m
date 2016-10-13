%Get PP combinations
comb=combnk([1 3 4 5 6 7],3);
%Set variable for rsquare,cvrsquare,mae,cvmae
rne=zeros(size(comb,1),6);
%Set PC to fit
pcn=1;
%Set degree to fit
deg=2;


for i=1:size(comb,1)
    reg=MultiPolyRegress(prm(:,comb(i,:)),PC(:,pcn),deg,'range');
    rne(i,1)=reg.RSquare;
    rne(i,2)=reg.CVRSquare;
    rne(i,3)=reg.MAE;
    rne(i,4)=reg.CVMAE;
    rne(i,5)=rne(i,1)-rne(i,2);
    rne(i,6)=rne(i,3)-rne(i,4);
end