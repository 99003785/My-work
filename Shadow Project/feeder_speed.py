class feeder_speed:
    testing_flag = 0 # testing ON = 1 and 0 = release

    def __init__(self, powerswitch):
        self.powerswitch = powerswitch

    def RegisteredSignals(self):



    def UnRegisteredSignals(self):




    def start_test_case(self):
        if self.testing_flag == 1:
            self.RegisterSignals()

    def end_test_case(self):
        if self.testing_flag == 1:
            self.UnRegisterSignals()

    def key_on(self):
        self.start_test_case()
        self.powerswitch.switch_key_on()
        #time.sleep(2)

    def key_off(self):
        #ignition key off

        self.start_test_case()
        self.powerswitch.switch_key_off()
        #time.sleep(2)

    def key_cycle(self):

        self.key_off()
        self.key_on()

    def engine_crank(self):
        #crank the engine
        self.powerswitch.switch_crank_on()
        time.sleep(2)

    def engine_off(self):
        #stop the engine by key cycling and not cranking engine
        self.key_cycle()

    def nvm_data_set_reset(self, nvm_loc, bit_pos, set_reset):
        # function to set/reset any bit of any eeprom location
        val1 = self.nvm_read(nvm_loc)  # current eeprom data

        val2 = pow(2, bit_pos)
        val = val1 & val2
        if set_reset == 1:
            if val == 0:  # if that particular bit is not set, then if condition becomes true and we have to set it otherwise it it is set than we can directly return
                value = val1 | val2
                self.camel_command.send_eeprom_value(nvm_loc, value, 0xF9)
        # no changes as bit is already set
        else:
            if val != 0:  # if that particular bit is set, then if condition becomes true and we have to reset it otherwise it it is reset than we can directly return
                value = val1 - val2
                self.camel_command.send_eeprom_value(nvm_loc, value, 0xF9)
        # no changes as bit is already reset

    #def HdrType(self,SensorA_3001, value):

        #self.SensorA_3001


    def FSCB_31443 (self):
        # applicable for variable feeder
        # monitor the feeder motor speed to detect slugs and prevent dangerously high speeds

        self.key_cycle ()
        #Set the input signal from Header Type Recognition, 1, Extended Sens. (SPN55 - AN57) to Open Line.
        #Set the input signal from Header Type Recognition, 2, Extended Sens. (SPN56 - AN58) to Open Line.

        #self.SE_HEADER_TYPE_command.set_io_voltage(self.SensorA_3001, 12000)
        #PB_HeaderInfo_75 = self.HdrType(self. SensorA_3001, 12000)

        self.nvm_data_set_reset(100,8,2)#Verify and if required set SE_Feeder_Speed_Range_Pickup_Header: Full range
        self.nvm_data_set_reset(100,9,2)

        #Check setting	Verify and if required set SE_Variable_Feeder_Drive_Installed: Installed NVM loc "20" bit 1
        # has decimal value : 1
        self.nvm_data_set_reset(20, 1, 1)
            #Check setting	Verify and if required set SE_Feeder_Driveline_Capacity = Standard Capacity	NVM loc "20"
            # bit 4 has decimal value : 0
        self.nvm_data_set_reset(20,4,0)

        self.engine_crank()
        # Verify the machine is in field mode.	Rx_FieldRoadMode_Sts = In Field Mode
        self. Rx_TCS_ThreshingSts = 1
        self.




    def FSCB_31444(self):








