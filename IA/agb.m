

function[x,ef]=agb(Npob,iter,pmuta)
%Aplicamos un genetico al problema min(f(x)=(x-128)^2), 
%0<=x<255,
%x entera
%Paso 1 Genera la poblacion inicial
Pobl=round(rand(1,Npob)*255)'
%Paso A: Evaluamos la poblacion segun la funcion de costo
%y ordenamos de los mas aptos a los menos aptos(los de
%evaluacion mas pequeña son los mejores)
evPobl=(Pobl-128).^2; %evalua un valor d la poblacion
PobEvPob=[Pobl,evPobl]; %concatena la poblacion y la evaluacion
Pordenada=sortrows(PobEvPob,2); %ordena el valor d la evaluacion del mas chico al grande
%xinicio=Pordenada(1,1);
efinicio=Pordenada(1,2);
grafica=[efinicio];
for iteraciones=1:iter
    %paso B : Seleccionamos la mitad de la poblacion para
    %cruzar 1&2,3&4,5&6
    %Generamos dos hijos para cada parejam pasamos a 
    %binario los primeros Npob/2 elemenos de pordenada
    Padresbinarios=dec2bin(Pordenada(1:Npob/2,1),8);
    %inicia la cruza 
    for j=1:Npob/4
        %genera el punto de cruza de 1 a 7 
        pc=ceil(rand(1)*7);
        Hijo(2*j-1,:)=[Padresbinarios(2*j-1,1:pc) Padresbinarios(2*j,pc+1:8)];
        Hijo(2*j,:)=[Padresbinarios(2*j,1:pc) Padresbinarios(2*j-1,pc+1:8)];
 end %fin de cruza
    Hijo;
    %Mutamos hijos
    for i=1: Npob/2
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
    Hijo;
    %Desechamos los mas malos
    %Juntamos Padres e Hijos
    Mpadresehijosb=[Padresbinarios;Hijo];
    %Pasamos a decimal
    Ppadresehijosd=bin2dec(Mpadresehijosb);..............................................................
    evPeH=(Ppadresehijosd-128).^2;
    PobEvPeH=[Ppadresehijosd,evPeH];
    PordenadaPeH=sortrows(PobEvPeH,2);
    Pordenada=PordenadaPeH(1:Npob,:);
    %x=Pordenada(1,1);
    ef=Pordenada(1,2);
    grafica=[grafica ef];
end % Fin de ieraciones
x=Pordenada(1,1);
cx=1:1:iter+1;
cx
plot(cx,grafica);