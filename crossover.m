function [arapop] = crossover(arapop, psize, pcross, d)
% �aprazlama olmayacaksa anne baba olddu�u gibi kal�p mutasyona ugruyor.
% �aprazlama olacaksa bu bireylerden 2 cocuk elde edilerek yine mutasyona
% sokuluyor.

% psize: pop_size, �ift olmas� �aprazlamaya girece�inden �ift olarak
% se�ilmeli tek oluursa bir tanesi �aprazlamaya girmeden �ikar
% pcross : �aprazlamaya olas�l�g�
% �r. 0.95 : %95 i�aprazlamaya girer.
% randperm(x) komutu x i random permutasyonunu verir. 
% d : problemin boyutu

% �ift Belirleme 
% randperm: rastgele s�ralama
pairs = randperm(psize);

for i =1: psize/2

    parent1idx = pairs(2*i-1);
    parent2idx = pairs(2*i);
    parent1 = arapop(parent1idx,:);
    parent2 = arapop(parent2idx,:);
    rs = unifrnd(0,1);
    if(rs<pcross)
        % cpoint: cross point, �aprazla noktas�
        cpoint = unidrnd(d-1);
        
        % cpoint 4 isee ilk 4 gen koruunucak sonraki genler aras�nda swap i�lemi yap�lacak
        dummy = parent1(cpoint+1:end);
        parent1(cpoint+1:end) = parent2(cpoint+1:end);
        parent2(cpoint+1:end) = dummy;
        arapop(parent1idx, :) = parent1;
        arapop(parent2idx, :) = parent2;
        
    end
end
end

