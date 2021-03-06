package com.activequant.interfaces.dao;

import java.util.List;

import com.activequant.domainmodel.Instrument;
import com.activequant.domainmodel.MarketDataInstrument;

public interface IMarketDataInstrumentDao extends IEntityDao<MarketDataInstrument> {

    /**
     * fetch all mdinstruments for a specific provider.
     * 
     * @param providerId
     *            f.e. Bloomberg
     * 
     * @return
     */
    MarketDataInstrument[] findForProvider(String providerId);

    int countForProvider(String providerId);
    
    String[] getProviders();
    

    MarketDataInstrument[] findFor(Instrument instrument);
    
    /**
     * returns the IDs for an instrument Id
     * @param instrumentId
     * @return
     */
    List<String> findIdsFor(String instrumentId); 
    
    /**
     * 
     * @param providerId for example BBGT
     * @param instrument any instrument
     * @return the MDI, in case it exists. if not, then null. 
     */
    MarketDataInstrument findFor(String providerId, Instrument instrument);

    MarketDataInstrument findByProvId(String providerId, String provSpecInstId);

    MarketDataInstrument[] findLike(String providerId, String provSpecInstId);

    MarketDataInstrument[] findForProvider(String providerId, int startIndex, int maxAmount);
}
