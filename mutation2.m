function [arapop] = mutation(arapop, pmutation, psize, d, as,us)
% pmutation : mutasyon olasýlýðý 
% psize: pop_size, satýr bazýnda
% d : gen sayýsý

% rs = unifrnd(0,1,[psize,d]);
% mutasyona ugricak kromozom sayýsý hesaplanýr.
%fix(): sayýyý en yakýn ondalýða yuvaarlar 

% mutasyona ugrayacak gen sayýsý
rs1 = fix(psize*pmutation*d);

if rs1  == 0
    rs1 = 1;
else
end

a = psize*d; % Toplamda bulunan gen sayýsý

% mutasyon yapýlacak gen secilir.
rs2 = randperm(a,rs1);

if rs2  == 0
    rs2 = 1;
else
end

for i = 1:rs1

    % mutasyonun hangi komozomun hangi geni için yapýldýðýný bulalým.
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

