clear all;
clc;
text = fileread('arithmetic_sourav.c');
lines = strsplit(text,newline);
occur = count(text,["if"])
k=0;
c=0;
j=0;
for i=1:length(lines)
    if contains(lines{i},"if")
        newStr = lines(i)
       % newStr1 = extractBetween(lines{i},"(",")");
        if contains(lines{i},"(")
            c=c+1
            if contains(lines{i},")")
                j=j+1
                if(c==j)
                        newStr1 = extractAfter(lines{i},"(")
                        newStr2 = extractBefore(newStr1,")")
      k=k+1;
                end
            end
        end
    end
end
        




