function Vertices = read_wrl(filename)

fid=fopen(filename);

data=textscan(fid,'%s');
k=1;
L=length(data{1,1});

D=find(strcmp(data{1,1},'IndexedFaceSet'));
E=find(strcmp(data{1,1},']'));
E1=E(E>D);
F=min(E1);
N=(F-D-9)/3; %No of vertices
for i=1:L
    if (strcmp(data{1,1}{i,1},'point')&&strcmp(data{1,1}{i+1,1},'['))
        X(k)=str2double(data{1,1}{i+2,1});
          Y(k)=  str2double(data{1,1}{i+3,1});
           Z(k)= str2double(data{1,1}{i+4,1});
        k=k+1;
    end;
    if k>N+1
        break;
end;
end;



X(1)=[];Y(1)=[];Z(1)=[];
data1=[X;Y;Z];
Vertices=data1';%Vertices in the order of (x,y,z) in a matrix.






    
       


       
 
       
