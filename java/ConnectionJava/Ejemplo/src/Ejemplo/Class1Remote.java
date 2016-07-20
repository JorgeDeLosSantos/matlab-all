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

import com.mathworks.toolbox.javabuilder.pooling.Poolable;
import java.util.List;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * The <code>Class1Remote</code> class provides a Java RMI-compliant interface to the 
 * M-functions from the files:
 * <pre>
 *  C:\\Users\\User\\Documents\\MATLAB\\Java\\ConnectionJava\\HolaMundo.m
 * </pre>
 * The {@link #dispose} method <b>must</b> be called on a <code>Class1Remote</code> 
 * instance when it is no longer needed to ensure that native resources allocated by this 
 * class are properly freed, and the server-side proxy is unexported.  (Failure to call 
 * dispose may result in server-side threads not being properly shut down, which often 
 * appears as a hang.)  
 *
 * This interface is designed to be used together with 
 * <code>com.mathworks.toolbox.javabuilder.remoting.RemoteProxy</code> to automatically 
 * generate RMI server proxy objects for instances of Ejemplo.Class1.
 */
public interface Class1Remote extends Poolable
{
    /**
     * Provides the standard interface for calling the <code>HolaMundo</code> M-function 
     * with 0 input argument.  
     *
     * Input arguments to standard interface methods may be passed as sub-classes of 
     * <code>com.mathworks.toolbox.javabuilder.MWArray</code>, or as arrays of any 
     * supported Java type (i.e. scalars and multidimensional arrays of any numeric, 
     * boolean, or character type, or String). Arguments passed as Java types are 
     * converted to MATLAB arrays according to default conversion rules.
     *
     * All inputs to this method must implement either Serializable (pass-by-value) or 
     * Remote (pass-by-reference) as per the RMI specification.
     *
     * No usage documentation is available for this function.  (To fix this, the function 
     * author should insert a help comment at the beginning of their M code.  See the 
     * MATLAB documentation for more details.)
     *
     * @param rhs The inputs to the M function.
     *
     * @return Array of length nargout containing the function outputs. Outputs are 
     * returned as sub-classes of <code>com.mathworks.toolbox.javabuilder.MWArray</code>. 
     * Each output array should be freed by calling its <code>dispose()</code> method.
     *
     * @throws java.jmi.RemoteException An error has occurred during the function call or 
     * in communication with the server.
     */
    public Object[] HolaMundo(Object... rhs) throws RemoteException;
  
    /** Frees native resources associated with the remote server object */
    void dispose() throws RemoteException;
}
