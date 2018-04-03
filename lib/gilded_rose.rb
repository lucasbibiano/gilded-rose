class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1

    if @name == "Aged Brie"
      increase_quality
      increase_quality if @days_remaining < 0
    elsif @name == "Sulfuras, Hand of Ragnaros"
      @days_remaining += 1
      @quality = 80
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      increase_quality if @days_remaining < 5
      increase_quality if @days_remaining < 10
      increase_quality

      @quality = 0 if @days_remaining < 0
    else
      decrease_quality
      decrease_quality if @days_remaining < 0
    end    
  end

  private

  def increase_quality(amount = 1)
    @quality = [@quality + amount, 50].min
  end

  def decrease_quality(amount = 1)
    @quality = [@quality - amount, 0].max
  end
end
