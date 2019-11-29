function P=Poblacion(N,M



 Hijo;
    %Mutamos hijos
    for i=1: Pob/2
        if(rand(1)<=pmuta)
            %disp('muto')
            %i
            %Le toca al hijo i mutarse, elegimos el bit a mutar
            bm=ceil(rand(1)*8);
            if (Hijo(i,bm)=='1')
                Hijo(i,bm)='0';
            else
                Hijo(i,bm)='1';
            end
        end
    end % Fin de Mutacion