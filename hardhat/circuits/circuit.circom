pragma circom 2.0.0;
include "../node_modules/circomlib/circuits/comparators.circom";
include "../node_modules/circomlib/circuits/poseidon.circom";


template MathHash () {  

   // Declaration of signals.  
   signal input soln;  
   signal input pubAns; 
   signal input difference;
   signal input salt; 
   signal input pubSolnHash;
   signal output solnHash;
  
   //calulate difference between solution and answer
   /*var diff ;
   if (soln > pubAns){
      diff = soln - pubAns;
   }
   else if (pubAns > soln){
      diff = pubAns - soln;
   }
   diff === difference;
   */
   component hasher = Poseidon(2);
   hasher.inputs[0] <== soln;
   hasher.inputs[1] <== salt;
   solnHash <== hasher.out;
   pubSolnHash === solnHash;

}

 component main {public [pubAns, pubSolnHash]} = MathHash();
