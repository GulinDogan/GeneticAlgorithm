function [ilkel_pop, obj, dogal_secilim, caprazlama, mutasyon, eniyicozum, eniyideger] = ga(as, us, d, psize, pcross, delta, pmutation)
% as = alt s�n�r
% us = ust s�n�r 
% d = Problemin boyutu, sutun say�s�, gen say�s�
% psize = pooulasyondaki kromozom say�s�

% uniform(): belirli bir d�zen ile belli aral�kta random da�al�m sa�lar. 
population= unifrnd(as,us,[psize,d]);
ilkel_pop = population;
iteration = 1;
eniyideger = 1000000;

while (iteration < 500)
   
    % Ama� fonksiyonu de�erlerini yazaca��m�z 0 matrisini olu�tur.
    obj = zeros(psize,1); 
   
    % Ama� fonksiyonu = sat�rdaki say�lar�n karelerim toplam�
    for i = 1:psize
        obj(i) = sum(population(i,:).^2); 
    end

    % En iyi de�eri (en iyi uygunluk fonksiyonu de�eri) bul ve o nihai cozum olsun
    if(min(obj)<eniyideger)
        eniyideger = min(obj);
        idx = find(obj == eniyideger); % en iy degere sahi olan verinin indexini bul
        eniyicozum = population(idx,:);
    end
    
    % ga fonk. i�inde dogalSecim fonk. cag�r�l�r.

    [arapop] = dogalSecilim(population, obj, psize)
    dogal_secilim = [arapop]

    [arapop] = crossover(arapop, psize, pcross, d)
    caprazlama = [arapop]

    [arapop] = mutation(arapop, pmutation, psize, d, delta, as,us)
    mutasyon = [arapop]
    iteration = iteration+1;

end
end

