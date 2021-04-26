class test_feeder_speed:

    def test_enable(self, setup, disconnect):
        setup.plantmodel.feederDri.RegisterSignals()
        setup.plantmodel.feederDri.enable()

    def test_FSCB_31443(self, setup, disconnect):
        assert setup.plantmodel.feederDri.FSCB_31443()

    def test_FSCB_31444(self, setup, disconnect):
        assert setup.plantmodel.feederDri.FSCB_31444()


