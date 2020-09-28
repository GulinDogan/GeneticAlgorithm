function [ilkel_pop, obj, dogal_secilim, caprazlama, mutasyon, eniyicozum, eniyideger] = ga(as, us, d, psize, pcross, delta, pmutation)
% as = alt sýnýr
% us = ust sýnýr 
% d = Problemin boyutu, sutun sayýsý, gen sayýsý
% psize = pooulasyondaki kromozom sayýsý

% uniform(): belirli bir düzen ile belli aralýkta random daðalým saðlar. 
population= unifrnd(as,us,[psize,d]);
ilkel_pop = population;
iteration = 1;
eniyideger = 1000000;

while (iteration < 500)
   
    % Amaç fonksiyonu deðerlerini yazacaðýmýz 0 matrisini oluþtur.
    obj = zeros(psize,1); 
   
    % Amaç fonksiyonu = satýrdaki sayýlarýn karelerim toplamý
    for i = 1:psize
        obj(i) = sum(population(i,:).^2); 
    end

    % En iyi deðeri (en iyi uygunluk fonksiyonu deðeri) bul ve o nihai cozum olsun
    if(min(obj)<eniyideger)
        eniyideger = min(obj);
        idx = find(obj == eniyideger); % en iy degere sahi olan verinin indexini bul
        eniyicozum = population(idx,:);
    end
    
    % ga fonk. içinde dogalSecim fonk. cagýrýlýr.

    [arapop] = dogalSecilim(population, obj, psize)
    dogal_secilim = [arapop]

    [arapop] = crossover(arapop, psize, pcross, d)
    caprazlama = [arapop]

    [arapop] = mutation(arapop, pmutation, psize, d, delta, as,us)
    mutasyon = [arapop]
    iteration = iteration+1;

end
end

