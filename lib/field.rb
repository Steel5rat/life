class Field
  def initialize rank
    @rank = rank
    @exarr = Array.new(@rank, [])
    for i in (0..@rank-1) do
      @exarr[i]=Array.new(@rank)
    end
    for i in (0..@rank-1) do
      for j in (0..@rank-1) do
        @exarr[i][j]=Cellar.new  [i,j]
      end
    end
   # @exarr[3][3].state=true   #тут можна задаць фігуры
   # @exarr[3][2].state=true   #толькі трэба аключыць рандом у канструктары клетак
   # @exarr[3][1].state=true
   # @exarr[2][3].state=true
   # @exarr[1][2].state=true
  end

  def nextPos
    @newarr = Array.new(@rank, [])
    for i in (0..@rank-1) do
      @newarr[i]=Array.new(@rank)
    end
    for i in (0..@rank-1) do
      for j in (0..@rank-1) do
        @newarr[i][j]=@exarr[i][j].clone
      end
    end        #нарэшце скапіявалі масіў. зрабіць прасьцей дакладна магчыма
    for i in (0..@rank-1) do
      for j in (0..@rank-1) do
         @newarr[i][j].state = @exarr[i][j].calcState @exarr
      end
    end
    @exarr=@newarr
  end

  def draw
    @exarr.each do |line|
      print '|'
      line.each do |ch|
         if ch.state
           print 'X|'
         else
           print ' |'
         end
      end
      puts
    end
  end
end