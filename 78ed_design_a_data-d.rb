# Design a Data-Driven IoT Device Controller

# Device Configuration
device_config = {
  name: "SmartHomeController",
  devices: [
    { id: 1, type: "temperature_sensor", pin: 18 },
    { id: 2, type: "humidity_sensor", pin: 23 },
    { id: 3, type: "light_bulb", pin: 24 },
    { id: 4, type: "fan", pin: 25 }
  ]
}

# Data Model
class Device
  attr_accessor :id, :type, :pin, :data
  def initialize(id, type, pin)
    @id = id
    @type = type
    @pin = pin
    @data = {}
  end
end

# IoT Device Controller
class IoTDeviceController
  def initialize(device_config)
    @devices = device_config[:devices].map do |device|
      Device.new(device[:id], device[:type], device[:pin])
    end
  end

  def read_data
    @devices.each do |device|
      case device.type
      when "temperature_sensor"
        device.data = { temperature: rand(20..30) }
      when "humidity_sensor"
        device.data = { humidity: rand(40..60) }
      when "light_bulb"
        device.data = { status: ["on", "off"].sample }
      when "fan"
        device.data = { speed: rand(1..5) }
      end
    end
  end

  def send_data
    # TO DO: Implement data sending logic (e.g., MQTT, HTTP, etc.)
    puts "Sending data..."
  end

  def run
    loop do
      read_data
      send_data
      sleep 5 # adjust the interval as needed
    end
  end
end

# Create and run the IoT Device Controller
controller = IoTDeviceController.new(device_config)
controller.run