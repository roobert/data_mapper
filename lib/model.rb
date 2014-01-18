#!/usr/bin/env ruby

class Network < ActiveRecord::Base
  has_many :switches, :dependent => :delete_all
end

class Switch < ActiveRecord::Base
  belongs_to :network
  has_many :ethernet_interfaces, :dependent => :delete_all
end

class Machine < ActiveRecord::Base
  has_many :machine_interfaces, :dependent => :delete_all
end

class MachineInterface < ActiveRecord::Base
  belongs_to :machine
  has_many :ip_addresses, :dependent => :delete_all
end

class IpAddress < ActiveRecord::Base
  belongs_to :machine_interface
end

class BridgeAddressTable < ActiveRecord::Base
  belongs_to :switch
  has_many :bridge_vlans, :dependent => :delete_all
end

class BridgeVlan < ActiveRecord::Base
  belongs_to :bridge_address_table
  has_many :macs, :dependent => :delete_all
end

class Mac < ActiveRecord::Base
  belongs_to :switchport
  belongs_to :bridge_vlan
end

class VlanInterface < ActiveRecord::Base
  belongs_to :switch
end

class EthernetInterface < ActiveRecord::Base
  belongs_to :switch
  has_many :switchports, :dependent => :delete_all
end

class Switchport < ActiveRecord::Base
  belongs_to :ethernet_interface
  has_many :vlans, :dependent => :delete_all
  has_many :macs, :dependent => :delete_all
end

class Vlan < ActiveRecord::Base
  belongs_to :switchport
end

class FullView < ActiveRecord::Base; end
class SecondView < ActiveRecord::Base; end
class MachineView < ActiveRecord::Base; end
