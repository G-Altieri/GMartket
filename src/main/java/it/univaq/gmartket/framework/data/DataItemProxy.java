package it.univaq.gmartket.framework.data;

/**
 *
 * @author giuse
 */
public interface DataItemProxy {

    boolean isModified();

    void setModified(boolean dirty);

}
