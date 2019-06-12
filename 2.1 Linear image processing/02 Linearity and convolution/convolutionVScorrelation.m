
% ��غ;��������padding�ķ�������'same'�����ǲ�0�������������Ĵ�С��ͬ��

function main()
    global ksize;
    f=[1 2 3; 4 5 6; 7 8 9;];
    % ʹ�ø�˹��ʱ�����ֲ����Ľ��һ�¡�
    g=[1 2 2; 2 4 2; 1 2 1;];
    ksize=size(g, 1);
    % ������㲻���н����ԣ�����f,g˳��õ��Ľ���Ƿ�ת�ģ�
    % ���������н����ԣ�����f,g˳��õ��Ľ������ͬ�ġ����������������Ӿ��廭һ�£�
    output = convolution(f, g);
    disp('f*g:');
    disp(output);
    
    % �������Ľ���ɲ������� %
    h=[2 1 5; 7 5 2; 3 9 1];
    disp('(f*g)*h');
    disp(convolution(convolution(f,g), h));
    
    disp('f*(g*h)');
    disp(convolution(f, convolution(g,h)));
    
end

function output=correlation(input, filter)
    disp('correlation..');
    
    global ksize;
    output_size = size(input, 1);
    output = zeros(output_size, output_size);
    input = padding_same(input);
    
    for i=1:output_size
        for j=1:output_size
            sum = 0;
            for u=1:ksize
                for v=1:ksize
                    sum = sum + filter(u,v) * input(i+u-1, j+v-1);
                end
            end
            output(i,j) = sum;
        end
    end
    
end

function output=convolution(input, filter)
    disp('convolution..');
    
    global ksize;
    output_size = size(input, 1);
    output = zeros(output_size, output_size);
    input = padding_same(input);
    
    for i=1:output_size
        for j=1:output_size
            sum = 0;
            for u=1:ksize
                for v=1:ksize
                    sum = sum + filter(u,v) * input(i+ksize-u, j+ksize-v); %��ת
                end
            end
            output(i,j) = sum;
        end
    end
    
end

function input_padding=padding_same(input)
    global ksize;
    input_padding = zeros(size(input) + 2*floor(ksize/2));
    input_size = size(input, 1);
    
    for i=1:input_size
        for j=1:input_size
            input_padding(i+floor(ksize/2), j+floor(ksize/2)) = input(i, j);
        end
    end
    
end