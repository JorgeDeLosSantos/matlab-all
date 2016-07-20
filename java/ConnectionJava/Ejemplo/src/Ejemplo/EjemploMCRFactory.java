/*
 * MATLAB Compiler: 4.18 (R2012b)
 * Date: Mon Oct 27 10:39:44 2014
 * Arguments: "-B" "macro_default" "-W" "java:Ejemplo,Class1" "-T" "link:lib" "-d" 
 * "C:\\Users\\User\\Documents\\MATLAB\\Java\\ConnectionJava\\Ejemplo\\src" "-w" 
 * "enable:specified_file_mismatch" "-w" "enable:repeated_file" "-w" 
 * "enable:switch_ignored" "-w" "enable:missing_lib_sentinel" "-w" "enable:demo_license" 
 * "-v" 
 * "class{Class1:C:\\Users\\User\\Documents\\MATLAB\\Java\\ConnectionJava\\HolaMundo.m}" 
 */

package Ejemplo;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class EjemploMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "Ejemplo_EEF7C6D805DDBDDF055FA4A2496E518A";
    
    /** Component name */
    private static final String sComponentName = "Ejemplo";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(EjemploMCRFactory.class)
        );
    
    
    private EjemploMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            EjemploMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{8,0,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
