function demo()

    % define some constants
    EOD = com.activequant.domainmodel.TimeFrame.EOD;
    INTERPOLRULE =  com.activequant.servicelayer.matlab.Parameter.INTERPOLRULE;
    DAYRULE =  com.activequant.servicelayer.matlab.Parameter.DAYRULE;
    INTERPOLRULE_CARRY_FORWARD = com.activequant.servicelayer.matlab.InterpolationRule.CARRY_FORWARD;
    DAYRULE_WEEKDAYS = com.activequant.servicelayer.matlab.DayRule.WEEKDAYS;

    % instantiate the facade. 
    msf = com.activequant.servicelayer.matlab.MatlabServiceFacade('debian-i386.local');
    paramMap = java.util.HashMap()

    

    array = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'DUKASCOPY_eurusd'}, ... 
            {'OPEN', 'HIGH', 'LOW', 'CLOSE'}, ... 
            20000101000000.0, paramMap);        
        
    % 
    paramMap.put(INTERPOLRULE, INTERPOLRULE_CARRY_FORWARD);    
    paramMap.put(DAYRULE, DAYRULE_WEEKDAYS);    
    
    array = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'CSI_AD', 'CSI_EURUSD'}, ... 
            {'CLOSE'}, ... 
            20000701000000.0, 20000710000000.0, paramMap);
        
        
    array = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'CSI_COX'}, ... 
            {'CLOSE'}, ... 
            20000101000000.0, 20121010000000.0, paramMap);    
    plot(array.timeStamps,array.values)
    dateaxis('x',1)
    
    
    pause
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    paramMap.clear()
    fprintf('Fetching intraday data\n')
    price= msf.fetchTSData(com.activequant.domainmodel.TimeFrame.MINUTES_5, {'BBGT_COU11 COMDTY'},{'CLOSE'},20110101000000.0, 20120101000000.0, paramMap);
    plot(price.timeStamps,price.values)
    dateaxis('x',1)
    
    %%%%%
    array = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'BBGT_LCM11 COMDTY'}, ... 
            {'OPEN', 'HIGH', 'LOW', 'CLOSE', 'OPEN_INT'}, ... 
            20000101000000.0, paramMap);   
    
    vals = array.values
    open = vals(1,:,1);
    high = vals(1,:,2);
    low = vals(1,:,3);
    close = vals(1,:,4);
    open_int = vals(1,:,5);

    
    % EOD
    price = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'BBGT_LCG09 COMDTY'}, ... 
            {'CLOSE', 'VOLUME'}, ... 
            20000101000000.0, paramMap);   
    vals = price.values;
    plot(price.timeStamps,vals(1,:,1))
    dateaxis('x',1)
    
    
    % intraday 
    price = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.MINUTES_1,  ...
            {'BBGT_KOQ11 COMDTY'}, ... 
            {'CLOSE', 'VOLUME'}, ... 
            20000101000000.0, paramMap);   
    vals = price.values;
    plot(price.timeStamps,vals(1,:,1))
    dateaxis('x',1)
    
    
    % intraday tick data
    price = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.MINUTES_5,  ...
            {'TICKDATA_ADU11'}, ... 
            {'CLOSE'}, ... 
            20000101000000.0, paramMap);   
    vals = price.values;
    plot(price.timeStamps,vals(1,:,1))
    dateaxis('x',14)
    
    % EOD
    price = msf.fetchTSData(com.activequant.domainmodel.TimeFrame.EOD,  ...
            {'BBGT_BZV07 INDEX'}, ... 
            {'CLOSE', 'VOLUME'}, ... 
            20000101000000.0, paramMap);   
    vals = price.values;
    plot(price.timeStamps,vals(1,:,1))
    dateaxis('x',1)
end

