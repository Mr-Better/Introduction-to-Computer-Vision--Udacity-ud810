function main()
    s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
    t = [1 1 1 0 0];
    disp('Signal:'), disp([1:size(s, 2); s]);
    disp('Template:'), disp([1:size(t, 2); t]);

    index = biaocheng(s, t);
    disp('Index:'), disp(index);
end

function max_idx=find_template_1D_by_correlation(s, t)
    slen = size(s, 2);
    tlen = size(t, 2);
    
    max_val = sum(s(1:tlen) .* t);
    max_idx = 1;
    
    for idx=2:slen-tlen+1
        cur_val = sum(s(idx:idx+tlen-1) .* t);
        disp(cur_val);
        if cur_val >= max_val
            max_val = cur_val;
            max_idx = idx;
        end
    end
end

function max_idx=find_template_1D_by_normalization_correlation(s, t)
    slen = size(s, 2);
    tlen = size(t, 2);
    
    max_val = normalization_correlation_version_2(s(1:tlen), t);
    max_idx = 1;
    
    for idx=2:slen-tlen+1
        cur_val = normalization_correlation_version_2(s(idx:idx+tlen-1), t);
        disp(cur_val);
        if cur_val > max_val
            max_val = cur_val;
            max_idx = idx;
        end
    end
end

function val=normalization_correlation_version_1(s, t)
    n = size(t, 1)^2;
    val = (1/(n*std(t)*std(s))) * sum(s .* t); % idx=4ʱ��std(s)=0����ʱ������0��val=inf��ô�죿
end

function val=normalization_correlation_version_2(s, t)
    n = size(t, 1)^2;
    val = (1/(norm(t)*norm(s))) * sum(s .* t); % normĬ�ϵڶ�����
end

% ���
function max_idx=biaocheng(s, t)
    p = normxcorr2(t, s); % p�����ϵ��
    [val max_idx] = max(p);
    max_idx = max_idx - size(t, 2) + 1;
end

