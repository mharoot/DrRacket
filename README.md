<h1>DrRacket</h1>

<h4>DrRacket is a general purpose, multi-paradigm programming language in the Lisp-Scheme family. </h4>

</br>
</br>
<h3> Determinstic Finite Automata </h3>
<ul>
<li><p> The program <a href="https://github.com/mharoot/DrRacket/blob/master/DFA/M1.lisp">M1.lisp</a> is of the dfa pictured below:</p>
<img src="https://raw.githubusercontent.com/mharoot/DrRacket/master/images/DeterministicFiniteStateMachine1.PNG"/>
</li>
<li>
<p> The program  <a href="https://github.com/mharoot/DrRacket/blob/master/DFA/M1.lisp">M1.lisp</a> output is below </p>
<ul>
<li>(test1)
</li><li>=> (q1 q2 q4 q6 q7 q7 accept)</li>
   <li>(test2)
</li><li>=> (q1 q2 q4 q1 q3 q5 accept)</li>
   <li>(test3)
</li><li>=> (q1 q3 q5 q7 accept)</li>
   <li>(test4)
</li><li>=> (q1 q3 q5 accept)</li>
   <li>(test5)
</li><li>=> (q1 q2 q4 q6 q7 q7 q7 accept)</li>
   <li>(test6)
</li><li>=> (q1 q2 q4 q1 q3 q2 q4 q1 accept)</li>
   <li>(test7)
</li><li>=> (q1 q3 q2 q4 q6 q1 q2 q4 q1 q3 q2 q4 q6 reject)</li>
</ul>
</li>
</ul>


