function BW=Grain2Boundary(A)

% Create Filter
[nx, ny, nz] = size(A);
current=zeros(size(A)+2);
current(1,1,1)=-6;
current(1,2,1)=1;
current(1,1,2)=1;
current(2,1,1)=1;
current(nx+2,1,1)=1;
current(1,1,nz+2)=1;
current(1,ny+2,1)=1;

% Pad Data
AA=zeros(size(A)+2);
AA(1,2:ny+1,2:nz+1)=A(1,:,:);
AA(nx+2,2:ny+1,2:nz+1)=A(nx,:,:);
AA(2:nx+1,1,2:nz+1)=A(:,1,:);
AA(2:nx+1,ny+2,2:nz+1)=A(:,ny,:);
AA(2:nx+1,2:ny+1,1)=A(:,:,1);
AA(2:nx+1,2:ny+1,nz+2)=A(:,:,nz);
AA(2:nx+1,2:ny+1,2:nz+1)=A;
clearvars A

% Get Boundary
BW=ifftn(fftn(AA).*conj(fftn(current)));
BW=BW(2:nx+1,2:ny+1,2:nz+1);BW=BW>0.1;