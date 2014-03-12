function conf_pos_mapa(file_xls,mask)

[dados,texto]=xlsread(file_xls);
[l,c]=size(texto);
if l>1
    texto=texto(2:length(texto),1);
end
n=length(dados);

%a=[[1:n]',a(:,1) a(:,3) a(:,2)];
b={'Taxon Name', 'Longitude', 'Latitude'};
load(mask)
cols
lin
pause

pos=loc_gps_env(dados,minx,miny,cellsize,lin)
R=zeros(length(pos),1);
for i=1:length(pos)
    if (pos(i,1)<=cols) & (pos(i,1)>0) & (pos(i,2)<=lin) & (pos(i,2)>0)
        [pos(i,1) pos(i,2)]
        R(i,1)=D(pos(i,2),pos(i,1));
    else
        R(i,1)=-1;
    end
end
R