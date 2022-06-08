def warmup(start_0, end_0)
 return [] if end_0 < start_0 
 return end_0 if end_0 == start_0
 n = start_0
 [[start_0] << warmup((start_0 + 1), end_0)].flatten()
end


def exp_0(num, times)
  return 1 if times == 0
  num * exp(num, (times - 1))
end

def exp_1(num, times)
  
end
