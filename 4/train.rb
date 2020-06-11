class Train
  attr_reader :type
  attr_reader :number
  attr_reader :speed
  attr_reader :route
  attr_accessor :vagons

  @@train = {}
  @@kol = 0

  def self.find(number)
    @@train[number]
  end

  def initialize(number, type)
    begin
      valid?
      @number = number
      @type = type
      @vagons = []
      @@kol += 1
      @@train[number] = self
      puts "Создан поезд с номером #{number}"
    rescue
      puts "Попробуйте ещё раз"
    end
  end

  def new_speed(speed)
    @speed = speed
    puts "Установлена скорость #{@speed}"
  end

  def speed_now
    @speed
  end

  def stop
    @speed = 0
    puts "Поезд остановился, есть возможность добавить вагон"
  end

  def add_vagon(vagon)
    if vagon.type == @type
      @vagons << vagon
      puts "Вагон успешно добавлен"
    end
  end

  def del_vagon(vagon)
    if vagon.type == @type
      @vagons.delete_at(-1)
      puts "Вагон успешно удалён"
    end
  end

  private
  def validate!
    raise "Неверный тип поезда" if type != 'Passenger' || type != 'Cargo'
    raise "Неверный формат номера поезда" if number !~ /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/
  end

  def valid?
    validate!
    true
  rescue
    puts "Введите данные ещё раз"
    false
  end
end

class PassengerTrain < Train  
end

class CargoTrain < Train
end

class Vagon
  attr_accessor :type

  def initialize(type)
    @type = type  
  end
end