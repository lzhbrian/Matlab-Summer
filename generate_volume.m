% return an array of volume strength
function volume_array = generate_volume(len_divide_speed,sample_rate)
    unit = sample_rate * len_divide_speed;
    x1 = linspace(0,len_divide_speed/6,unit/6);
    x2 = linspace(0,len_divide_speed/6,unit/6);
    x3 = linspace(1,1,unit/3);
    x4 = linspace(0,len_divide_speed/3,unit-length([x1,x2,x3]));
    volume_array = [6/len_divide_speed*x1, 1-1.2/len_divide_speed*x2,...
        0.8*x3, 0.8*exp(-(100-80*len_divide_speed)*x4)];
    plot(volume_array);
end