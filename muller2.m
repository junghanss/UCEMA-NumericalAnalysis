n=input('Ingrese el grado del polinomio: ');
for k=n:-1:0
   disp('Ingrese el coeficiente de grado');
   disp(k);
   w(k+1)=input('');
end

for k=0:n
   disp([k w(k+1)]);
end

disp('Ingrese los tres valores iniciales');
x0=input('x0 ');
x1=input('x1 ');
x2=input('x2 ');

clear trayectoria
close all

iteracion_nro=1;
continuar=1;
while continuar==1
   
x=x0; f=0; for k=0:n; f=f+w(k+1)*x^k; end; f0=f;
x=x1; f=0; for k=0:n; f=f+w(k+1)*x^k; end; f1=f;
x=x2; f=0; for k=0:n; f=f+w(k+1)*x^k; end; f2=f;

na=(x1-x2)*(f0-f2)-(x0-x2)*(f1-f2);
nb=(x0-x2)^2*(f1-f2)-(x1-x2)^2*(f0-f2);
dab=(x0-x2)*(x1-x2)*(x0-x1);
a=na/dab;
b=nb/dab;
c=f2;

x3=x2-2*c/(b+sign(b)*sqrt(b^2-4*a*c))
trayectoria(iteracion_nro)=x3;
iteracion_nro=iteracion_nro+1;
x0=x1; x1=x2; x2=x3;
plot(real(trayectoria),imag(trayectoria),'-');
continuar=1;
clave=input('continuar iterando? si: Enter   no: 0 ');
   if ~isempty(clave)
      continuar=0;
   end
   
pause(1)
end



