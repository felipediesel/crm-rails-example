class Phone
  attr_reader :country_code, :area_code, :number

  def initialize(country_code, area_code, number)
    @country_code, @area_code, @number =
    country_code, area_code, number
  end

  def ==(value)
    @country_code == value.country_code &&
    @area_code == value.area_code &&
    @number == value.number
  end

  def to_s
    @number ? "+#{@country_code} #{@area_code} #{@number}" : ""
  end
end
