function [arapop] = mutation(arapop, pmutation, psize, d, as,us)
% pmutation : mutasyon olas�l��� 
% psize: pop_size, sat�r baz�nda
% d : gen say�s�

% rs = unifrnd(0,1,[psize,d]);
% mutasyona ugricak kromozom say�s� hesaplan�r.
%fix(): say�y� en yak�n ondal��a yuvaarlar 

% mutasyona ugrayacak gen say�s�
rs1 = fix(psize*pmutation*d);

if rs1  == 0
    rs1 = 1;
else
end

a = psize*d; % Toplamda bulunan gen say�s�

% mutasyon yap�lacak gen secilir.
rs2 = randperm(a,rs1);

if rs2  == 0
    rs2 = 1;
else
end

for i = 1:rs1

    % mutasyonun hangi komozomun hangi geni i�in yap�ld���n� bulal�m.
    kromozom = ceil(rs2(1,i)/d);
    gen = mod(rs2(1,i),d);


    if kromozom == 0
        kromozom = 1
    else
    end
   
    if gen == 0
        gen = d
   else
   end
    
    random = unifrnd (as,us);
    arapop(kromozom,gen) = random;

    
end

end

