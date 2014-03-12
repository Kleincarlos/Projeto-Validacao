function conf_dir_asc(dir_name_env,ext_env)


%recolhendo o nome dos arquivos ambientais
dir_name=list_dir(dir_name_env,ext_env)

for i=1:length(dir_name)
filename=strcat(dir_name_env,dir_name(i).name)
 S(i,1)={dir_name(i).name(1:length(dir_name(i).name)-4)};
 fid1=fopen(filename,'r');
 if fid1<0
     disp('arquivo inexistente');
 else
    a=fscanf(fid1,'%s',1); cols(i,1)=fscanf(fid1,'%i',1);
    a=fscanf(fid1,'%s',1); lin(i,1)=fscanf(fid1,'%i',1);
    a=fscanf(fid1,'%s',1); minx(i,1)=fscanf(fid1,'%f\n',1);
    a=fscanf(fid1,'%s',1); miny(i,1)=fscanf(fid1,'%f\n',1);
    a=fscanf(fid1,'%s',1); cellsize(i,1)=fscanf(fid1,'%f\n',1);
    a=fscanf(fid1,'%s',1); empvalue(i,1)=fscanf(fid1,'%f\n',1);
 end

 fclose(fid1);
end
file_name1=strcat(dir_name_env,'analise.xls')
xlswriteString(file_name1,S,[cols,lin,minx,miny,cellsize,empvalue],{'arquivos','cols','lin','minx','miny','cellsize','empvalue'})