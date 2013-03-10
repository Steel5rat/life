class Cellar
  attr_accessor :state
  def initialize input
    @i=input[0]
    @j=input[1]
    if 3==rand(5)
      @state=true
    else
      @state=false
    end
  end

  def clone
    Cellar.new [@i,@j]
  end

  def calcState arr
    @arr=arr
    @rank=@arr[0].length
    countOfLive=0
    i=@i
    j=@j
    countOfLive+=checkCell [i+1,j-1]
    countOfLive+=checkCell [i+1,j]
    countOfLive+=checkCell [i+1,j+1]
    countOfLive+=checkCell [i,j-1]
    countOfLive+=checkCell [i,j+1]
    countOfLive+=checkCell [i-1,j-1]
    countOfLive+=checkCell [i-1,j]
    countOfLive+=checkCell [i-1,j+1]
    if @arr[@i][@j].state
      if countOfLive<=3 && countOfLive>=2
          true
      else
          false
      end
    else
       if countOfLive==3
          true
       else
          false
       end
    end
  end

  def checkCell input
    i=controlInput input[0]
    j=controlInput input[1]
    if @arr[i][j].state
       1
    else
       0
    end
  end

  def controlInput var  #гэта для таго, каб сувязі пераходзілі з аднаго боку на іншы
    if var==-1          #"шаравідны сьвет"
      var=@rank-1
    elsif var==@rank
      var=0
    end
    var
  end
end