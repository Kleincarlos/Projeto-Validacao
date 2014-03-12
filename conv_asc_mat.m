function conv_asc_mat(dir_name,tt)
%conv_asc_mat(dir_name)
%
% converte arquivo de imagem.asc em .mat 
% para aumentar a velocidade de processamento
D=[];

if nargin==1
    disp('    ')
    ddir=dir(strcat(strcat(dir_name),'*.asc'));
else
    disp('    ')
    ddir=dir(strcat(strcat(dir_name),strcat('*',tt)));
end
grupos=max(size(ddir));
disp(strcat('grupos = ',num2str(grupos)));
disp(' ');

G=struct('nome',{''},'cols',[],'lin',[],'minx',[],'miny',[],'cellsize',[],'empvalue',[]);

for i=1:grupos
    filename=strcat(dir_name,ddir(i).name);
    disp(ddir(i).name);
    bs=max(findstr('_',ddir(i).name));
    ddir(i).name(bs+3:length(ddir(i).name)-4);
    as=str2num(ddir(i).name(bs+3:length(ddir(i).name)-4));
    
    
   
    [ls,cs]=size(filename);
    in=max(findstr('\',filename));
    G(i).nome=filename(in+1:cs-4);
    %fin=findstr('_',filename); %retirar
           
    
     fid1=fopen(filename,'r');
     
     a=fscanf(fid1,'%s',1);
     cols=fscanf(fid1,'%i',1);G(i).cols=cols;
     
     a=fscanf(fid1,'%s',1);
     lin=fscanf(fid1,'%i',1);G(i).lin=lin;
     
     a=fscanf(fid1,'%s',1);
     minx=fscanf(fid1,'%g',1);G(i).minx=minx;
     
     a=fscanf(fid1,'%s',1);
     miny=fscanf(fid1,'%g',1);G(i).miny=miny;
     
     a=fscanf(fid1,'%s',1);
     cellsize=fscanf(fid1,'%g',1);G(i).cellsize=cellsize;
     
     %mudança para idrisi
     a=fscanf(fid1,'%s',1);
     empvalue=fscanf(fid1,'%g',1);
     %empvalue=-9999;
     G(i).empvalue=empvalue;
     
      
    D=zeros(lin,cols);
    for L=1:lin
       
    %home;disp(strcat('Porcentagem do final = ',num2str(L/lin)));
        for C=1:cols
            D(L,C)=fscanf(fid1,'%g',1);
%           if D(L,C)==255,
%             D(L,C)=-9999;
%           end
        end
    end
 %   filename
 %   figure(1)
%    imagesc(D)
    fclose(fid1);

    [ls,cs]=size(filename);
    filename=strcat(filename(1:cs-4),'.mat'); %correto
    %filename=strcat(strcat(strcat(strcat(dir_name,filename(fin(2)+1:cs-4)),'_'),filename(fin(1)+1:fin(2)-1)),'.mat') %retirar
    save (filename,'D','cols','lin','minx','miny','cellsize','empvalue');
    %writeasc(D,1,filename,'.asc',minx,miny,cellsize)
    
    %colormap([[0.5,0.5,0.5];hsv(100);[0,0,0]]);
    %figure(i)
    %h=image(D);
    %set(h,'CDataMapping','scaled')
    %figure(i)
    %pause(10)
end
%filename=strcat(filename(1:in),'index_mat.xls')
%xlswrite(filename,G)