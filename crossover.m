function [arapop] = crossover(arapop, psize, pcross, d)
% Çaprazlama olmayacaksa anne baba oldduðu gibi kalýp mutasyona ugruyor.
% Çaprazlama olacaksa bu bireylerden 2 cocuk elde edilerek yine mutasyona
% sokuluyor.

% psize: pop_size, çift olmasý çaprazlamaya gireceðinden çift olarak
% seçilmeli tek oluursa bir tanesi çaprazlamaya girmeden çikar
% pcross : çaprazlamaya olasýlýgý
% ör. 0.95 : %95 içaprazlamaya girer.
% randperm(x) komutu x i random permutasyonunu verir. 
% d : problemin boyutu

% Çift Belirleme 
% randperm: rastgele sýralama
pairs = randperm(psize);

for i =1: psize/2

    parent1idx = pairs(2*i-1);
    parent2idx = pairs(2*i);
    parent1 = arapop(parent1idx,:);
    parent2 = arapop(parent2idx,:);
    rs = unifrnd(0,1);
    if(rs<pcross)
        % cpoint: cross point, çaprazla noktasý
        cpoint = unidrnd(d-1);
        
        % cpoint 4 isee ilk 4 gen koruunucak sonraki genler arasýnda swap iþlemi yapýlacak
        dummy = parent1(cpoint+1:end);
        parent1(cpoint+1:end) = parent2(cpoint+1:end);
        parent2(cpoint+1:end) = dummy;
        arapop(parent1idx, :) = parent1;
        arapop(parent2idx, :) = parent2;
        
    end
end
end

