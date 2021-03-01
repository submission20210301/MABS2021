;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; VARIABLES AND EXTENSTION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extensions [profiler]

breed [ rissets risset ]
breed [ spices spice ]

rissets-own [

  ;states
  energy
  decision
  age

  ;sensors
  success?
  myenemy
  myspice

  ;evolutionary decision
  genotype

  ;learing decision
  weight
  success

]

spices-own [

  ;states
  energy

]

patches-own [

]

globals [

  mean-genotype
  stddev-genotype
  skew-genotype
  kurt-genotype

  mean-weight
  stddev-weight
  skew-weight
  kurt-weight

  countactions
  countactions-begin
  countactions-end

  death-fight
  death-energy
  death-age

  mean-energy
  stddev-energy
  skew-energy
  kurt-energy

  population-excess
  counter-check1
  counter-check2
  talker
]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INITIALIZAION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup

  clear-all

  creation-world
  print ( word "********** NEW SIMULATON ********** # PATCHES: " count patches )
  creation-rissets
  creation-spice-setup

  creation-globals
  globals-computing


  reset-ticks

end

to creation-world

  random-seed 0

  resize-world 0 size-world 0 size-world
  set-patch-size 250 / size-world
  ask patches [ set pcolor white ]

end

to creation-rissets

  create-rissets init-rissets [

    ;general states and parameters
    set shape "turtle"
    set color blue
    setxy random-pxcor random-pycor
    set heading 90 * random 4

    ;states
    set energy init-energy
    set decision "none"
    set age 0


    set success? 0

    ;parameters
    set genotype n-values 2 [ i -> random-float 1 ]
    set success n-values 2 [ i -> [] ]
    set weight n-values 2 [ i -> 0.5 ]

  ]

  ask rissets [

    let flag true

    while [ flag ] [

;      if who = 4 [ print ( word "x: " xcor " y: " ycor ) ]

      let myx xcor
      let myy ycor

      ifelse any? other rissets in-radius 0.2 [ setxy random-pxcor random-pycor ] [ set flag false ]

    ]

  ]


end

to creation-spice-setup

  create-spices int ( ( count patches ) * ( spices-saturation / 100 ) ) [

    ;general states and parameters
    set shape "flower"
    set color red
    setxy random-pxcor random-pycor

    ;states
    set energy energy-spice

  ]


end

to creation-globals

  ;these are 5 because also the 2 random possibilites are counted
  set countactions n-values 4 [ i -> 0 ]
  set countactions-begin n-values 4 [ i -> 0 ]
  set countactions-end n-values 4 [ i -> 0 ]

  set mean-genotype n-values 2 [ i -> 0 ]
  set stddev-genotype n-values 2 [ i -> 0 ]
  set skew-genotype n-values 2 [ i -> 0 ]
  set kurt-genotype n-values 2 [ i -> 0 ]

  set mean-weight n-values 2 [ i -> 0 ]
  set stddev-weight n-values 2 [ i -> 0 ]
  set skew-weight n-values 2 [ i -> 0 ]
  set kurt-weight n-values 2 [ i -> 0 ]

end



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DYNAMIC OF THE MODEL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go

  ask rissets [

    perceive
    decision-making
    action
    update-beliefs
    do-countactions

    energy-consume
    reproduce
    aging
  ]

  creation-spices-go
  globals-computing

  if count rissets = 0 [ stop ]

  tick

end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DECISION MAKING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to perceive

  ; clear short-term states
  set decision "none"
  set success? 0

  ;set sensors
  set myspice min-one-of spices in-radius vision [ distance myself ]
  set myenemy min-one-of other rissets in-radius vision [ distance myself ]

  ;fix sensors

  if myspice = nobody [ set myspice "none" ]
  if myenemy = nobody [ set myenemy "none" ]

end

to decision-making

  if myspice = "none" and myenemy = "none" [ stop ]

  let d0 "none" ;desire of energy
  let d1 "none" ;desire of fighting

  if myspice != "none" [
    set d0 ( vision - distance myspice ) / vision
  ]

  if myenemy != "none" [
    set d1 ( vision - distance myenemy ) / vision
    ;print ( word "ticks: " ticks " - who: " who " - myenemy: " myenemy " - check: 1")
  ]

  let i0 "none"
  let i1 "none"
  if d0 != "none" [
    set i0 d0 * ( item 0 genotype * ( 1 - learning-weight ) + item 0 weight * learning-weight )
  ]

  if d1 != "none" [
    set i1 d1 * ( item 1 genotype * ( 1 - learning-weight ) + item 1 weight * learning-weight )
  ]

  let ilist list i0 i1
  let imax max ilist

  if imax = i0 [ set decision "gofood"
    ;if myspice = "none" [ print ( word "ticks: " ticks " - who: " who " - myspice: " myspice " - check: 2" ) ]
  ]
  if imax = i1 [ set decision "attack"
    ;if myenemy = "none" [ print ( word "ticks: " ticks " - who: " who " - myenemy: " myenemy " - check: 2" ) ]
  ]

  if random 100 = 0 [ serendipity ] ;to take also random decision and not be stucked in the first decision


end

to serendipity

  if myspice != "none" and myenemy != "none" [

    if decision = "gofood" [ set decision "attack" ]
    if decision = "attack" [ set decision "gofood" ]

  ]

end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ACTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to action

  if decision = "gofood" [

    ifelse distance myspice < 0.3 [ action-eat ] [ action-gofood ]

  ]

  if decision = "attack" [

    ;if myenemy = "none" [ print who ]
    ifelse distance myenemy < 0.3 [ action-attack ] [ action-goenemy  ]

  ]

  if decision = "none" [
    action-random
  ]

end

to action-eat

  let energyin min list [ energy ] of myspice energy-in-per-tick

  set energy energy + energyin
  set success? energyin

  ask myspice [
    set energy energy - energyin
    if energy <= 0 [
      die
    ]
  ]

end

to action-gofood

  face myspice
  superposition
  fd 1

end

to action-attack

  let winner 0 ;defensor wins
  if random-float 1 < attack-chance [
    set winner 1 ;attacker wins
  ]

  ifelse winner = 1 [

    ask myenemy [
      set talker energy * attack-gain
      set energy energy - talker

    ]
    set energy energy + talker
    set success? talker
    ;print ( word who " " talker )
  ]
  [

    set talker energy * attack-loss
    set energy energy - talker
    set success? -1 * talker

    ask myenemy [
      set energy energy + talker
    ]

  ]



end

to action-goenemy

  face myenemy
  superposition
  fd 1

end

to action-random

  set decision "randommove"
  if random-float 1 < exploration-rate [
    set decision "randomchange"
    if ( random-float 1 / exploration-direction-changing-time )  > 0 [
      set heading 90 * random 4
    ]
    fd 1
  ]

end

to update-beliefs

  set success? max list ( min list success? 1 ) 0

  let index "none"
  if decision = "gofood" [ set index 0 ]
  if decision = "attack" [ set index 1 ]
  if index = "none" [ stop ]

  let old-success item index success
  set old-success fput success? old-success
  if length old-success > max-memory [
    set old-success but-last old-success
  ]
  set success replace-item index success old-success
  ;let newweight max list ( mean ( item index success ) ) 0
  let newweight mean ( item index success )
  set weight replace-item index weight newweight


end


to do-countactions


  if decision = "gofood" [
    set countactions replace-item 0 countactions ( item 0 countactions + 1 )
    if ticks < length-simulation * 0.1 [ set countactions-begin replace-item 0 countactions-begin ( item 0 countactions-begin + 1 ) ]
    if ticks > length-simulation * 0.9 [ set countactions-end replace-item 0 countactions-end ( item 0 countactions-end + 1 ) ]
  ]
  if decision = "attack" [
    set countactions replace-item 1 countactions ( item 1 countactions + 1 )
    if ticks < length-simulation * 0.1 [ set countactions-begin replace-item 1 countactions-begin ( item 1 countactions-begin + 1 ) ]
    if ticks > length-simulation * 0.9 [ set countactions-end replace-item 1 countactions-end ( item 1 countactions-end + 1 ) ]
  ]
  if decision = "randommove" [
    set countactions replace-item 2 countactions ( item 2 countactions + 1 )
    if ticks < length-simulation * 0.1 [ set countactions-begin replace-item 2 countactions-begin ( item 2 countactions-begin + 1 ) ]
    if ticks > length-simulation * 0.9 [ set countactions-end replace-item 2 countactions-end ( item 2 countactions-end + 1 ) ]
  ]
  if decision = "randomchange" [
    set countactions replace-item 3 countactions ( item 3 countactions + 1 )
    if ticks < length-simulation * 0.1 [ set countactions-begin replace-item 3 countactions-begin ( item 3 countactions-begin + 1 ) ]
    if ticks > length-simulation * 0.9 [ set countactions-end replace-item 3 countactions-end ( item 3 countactions-end + 1 ) ]
  ]


end

to energy-consume

  set energy energy - energy-consume-basic
  if energy < 0 [
    set death-energy death-energy + 1
    die
  ]

end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LIFE CYCLE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to reproduce

  if random-float 1 < reproduction-rate * ( 1 / ( 1 + population-excess ) ) and count rissets < count patches [

    hatch 1 [

      let i 0
      while [ i < length weight ] [

        let i-success item i success
        let n-new-success int ( learning-trasmission * length i-success )

        if n-new-success > 0 [ ;to not have problem with cropping to short memory

          set i-success shuffle i-success
          if length i-success > 2 [
            ;print ( word "i-succ: " i-success "n-new-succ: " n-new-success )
            set i-success sublist i-success 0 ( n-new-success - 1 )
          ]

          let i-weight 0.5
          if i-success != [] [ set i-weight max list ( mean i-success ) 0 ]

          set success replace-item i success i-success
          set weight replace-item i weight i-weight

        ]


        set i i + 1

      ]

      set age 0

      let newpatch one-of patches with [ not any? turtles-here with [ breed = rissets ] ]
      setxy [ pxcor ] of newpatch [ pycor ] of newpatch


      set heading 90 * random 4

      set energy init-energy

      set success? 0

      mutation

    ]

  ]


end

to mutation

  let i 0
  while [ i < length genotype ] [

    if random-float 100 < mutation-rate [
      let sign-mutation 1
      if random 2 < 1 [ set sign-mutation -1 ]
      let this-mutation-intensity mutation-intensity * random-float 1
      set genotype replace-item i genotype ( ( item i genotype ) + ( ( item i genotype ) * this-mutation-intensity * sign-mutation ) )
    ]

    set i i + 1
  ]

end

to aging

  set age age + 1

  if random ( avg-life * 2 ) < 1 + ( population-excess * 2 ) [
    set death-age death-age + 1
    die
  ]


end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ENVIRONMENT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to creation-spices-go

  if count spices < int ( ( count patches ) * ( spices-saturation / 100 ) ) [

    create-spices int ( ( count patches ) * ( spices-saturation / 100 ) ) - count spices [

      ;general states and parameters
      set shape "flower"
      set color red
      let flag false
      while [ not flag ] [
        let myx random-pxcor
        let myy random-pycor
        setxy myx myy
        if not any? other spices with [ xcor = myx and ycor = myy ] [
          set flag true
        ]
      ]



      ;states
      set energy energy-spice

    ]

  ]

end

to globals-computing

  set population-excess max ( list ( count rissets - max-rissets ) 0 )
  ;compute only if enought rissets
  if count rissets < 5 [ stop ]

  let i 0

  while [ i < length [ genotype ] of one-of rissets ] [

    let this1-mean mean [ item i genotype ] of rissets
    let this1-stddev standard-deviation [ item i genotype ] of rissets

    set mean-genotype replace-item i mean-genotype ( this1-mean )
    set stddev-genotype replace-item i stddev-genotype ( this1-stddev )

    let this2-mean mean [ item i weight ] of rissets
    let this2-stddev standard-deviation [ item i weight ] of rissets

    set mean-weight replace-item i mean-weight ( this2-mean )
    set stddev-weight replace-item i stddev-weight ( this2-stddev )

    if this1-stddev != 0 [

      let this1-skew  mean [ ( ( item i genotype - this1-mean ) / this1-stddev ) ^ 3 ] of rissets
      let this1-kurt mean [ ( ( ( item i genotype ) - this1-mean ) / this1-stddev ) ^ 4 ] of rissets

      set skew-genotype replace-item i skew-genotype ( this1-skew )
      set kurt-genotype replace-item i kurt-genotype ( this1-kurt )

    ]

    if this2-stddev != 0 [

      let this2-skew  mean [ ( ( item i weight - this2-mean ) / this2-stddev ) ^ 3 ] of rissets
      let this2-kurt mean [ ( ( ( item i weight ) - this2-mean ) / this2-stddev ) ^ 4 ] of rissets

      set skew-weight replace-item i skew-weight ( this2-skew )
      set kurt-weight replace-item i kurt-weight ( this2-kurt )

    ]


    set i i + 1

  ]

  set mean-energy mean [ energy ] of rissets
  set stddev-energy standard-deviation [ energy ] of rissets
  if stddev-energy > 0 [
    set skew-energy mean [ ( ( energy - mean-energy ) / stddev-energy ) ^ 3 ] of rissets
    set kurt-energy mean [ ( ( energy - mean-energy ) / stddev-energy ) ^ 4 ] of rissets
  ]



end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GRAPHICS, COMMANDS AND REFINEMENTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to startup
  setup
end

to superposition

  if heading <= 45 or heading > 315 [ set heading 0 set talker patch-at 0 1 ] ;move up
  if heading <= 135 and heading > 45 [ set heading 90 set talker patch-at 1 0 ] ;move left
  if heading <= 225 and heading > 135 [ set heading 180 set talker patch-at 0 -1 ] ;move down
  if heading <= 315 and heading > 225 [ set heading 270 set talker patch-at -1 0 ] ;move right


end

to use-profiler
  setup                  ;; set up the model
  profiler:start         ;; start profiling
  repeat profiler-time [ go ]       ;; run something you want to measure
  profiler:stop          ;; stop profiling
  print profiler:report  ;; view the results
  profiler:reset
end
@#$#@#$#@
GRAPHICS-WINDOW
281
10
547
277
-1
-1
8.620689655172415
1
10
1
1
1
0
1
1
1
0
29
0
29
1
1
1
ticks
30.0

BUTTON
0
10
66
43
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
68
10
138
43
go (once)
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
140
10
224
43
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
68
46
224
79
profiler-time
profiler-time
50
1000
150.0
50
1
ticks
HORIZONTAL

SLIDER
1
100
229
133
size-world
size-world
11
50
29.0
1
1
patches
HORIZONTAL

SLIDER
0
135
229
168
init-rissets
init-rissets
20
500
139.0
10
1
turtles
HORIZONTAL

SLIDER
0
170
230
203
init-energy
init-energy
0.1
5
6.739773037891835
0.1
1
mAH
HORIZONTAL

SLIDER
1
205
231
238
spices-saturation
spices-saturation
0.5
25
2.948759512567113
0.25
1
%
HORIZONTAL

SLIDER
0
259
231
292
energy-spice
energy-spice
0.5
20
6.1194697262633095
0.5
1
mA
HORIZONTAL

TEXTBOX
66
82
175
100
Initialization
14
0.0
1

TEXTBOX
69
240
219
258
Parameters
14
0.0
1

SLIDER
0
294
231
327
vision
vision
1
5
1.402150863527202
1
1
patches
HORIZONTAL

SLIDER
1
329
231
362
max-energy
max-energy
1
10
8.064003405999753
0.1
1
mAH
HORIZONTAL

SLIDER
2
466
235
499
attack-chance
attack-chance
0.05
0.95
0.2641467902752306
0.05
1
NIL
HORIZONTAL

SLIDER
1
397
233
430
energy-consume-basic
energy-consume-basic
0.01
0.2
0.04773235274514495
0.01
1
mAH
HORIZONTAL

SLIDER
1
363
231
396
energy-in-per-tick
energy-in-per-tick
0.5
5
0.550950803430388
0.5
1
mAH
HORIZONTAL

SLIDER
2
501
236
534
reproduction-rate
reproduction-rate
0.01
0.05
0.04349556475858585
0.01
1
NIL
HORIZONTAL

SLIDER
2
570
236
603
mutation-rate
mutation-rate
0.01
0.2
0.2
0.01
1
NIL
HORIZONTAL

SLIDER
2
535
236
568
mutation-intensity
mutation-intensity
0.01
0.5
0.5
0.01
1
NIL
HORIZONTAL

PLOT
603
10
1024
234
Genes Means
NIL
NIL
0.0
10.0
0.0
1.0
true
true
"" ""
PENS
"Reach Food" 1.0 0 -13840069 true "" "if ticks > 0 [ plot item 0 mean-genotype ]"
"Reach Enemy" 1.0 0 -2674135 true "" "if ticks > 0 [ plot item 1 mean-genotype ]"

PLOT
1025
10
1237
160
Popolation
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count rissets"

SLIDER
0
605
236
638
max-rissets
max-rissets
200
2000
139.0
100
1
rissets
HORIZONTAL

PLOT
603
238
1025
451
Decisions
NIL
NIL
0.0
10.0
0.0
1.0
true
true
"" ""
PENS
"Reach Food" 1.0 0 -13840069 true "" "if sum countactions > 0 [ plot item 0 countactions / sum countactions ]"
"Reach Enemy" 1.0 0 -2674135 true "" "if sum countactions > 0 [ plot item 1 countactions / sum countactions ]"

SLIDER
278
382
508
415
learning-weight
learning-weight
0
1
0.11412911719725694
0.01
1
NIL
HORIZONTAL

SLIDER
278
296
503
329
avg-life
avg-life
100
1000
641.0
100
1
ticks
HORIZONTAL

PLOT
603
454
1026
673
Weight
NIL
NIL
0.0
0.0
0.0
1.0
true
true
"" ""
PENS
"Reach Food" 1.0 0 -13840069 true "" "if ticks > 0 [ plot item 0 mean-weight ]"
"Reach Enemy" 1.0 0 -2674135 true "" "if ticks > 0 [ plot item 1 mean-weight ]"

BUTTON
0
46
66
79
profiler
use-profiler
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
278
456
509
489
learning-trasmission
learning-trasmission
0
1
0.10258951420577422
0.01
1
NIL
HORIZONTAL

SLIDER
279
332
504
365
length-simulation
length-simulation
1
5000
3990.0
1
1
NIL
HORIZONTAL

PLOT
1027
163
1237
313
Death
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Age" 1.0 0 -16777216 true "" "plot death-age"
"Fight" 1.0 0 -13345367 true "" "plot death-fight"
"Energy" 1.0 0 -2674135 true "" "plot death-energy"

SLIDER
277
492
510
525
exploration-rate
exploration-rate
0
1
0.6856205445115673
0.01
1
NIL
HORIZONTAL

SLIDER
277
526
511
559
exploration-direction-changing-time
exploration-direction-changing-time
1
10
3.0
1
1
ticks
HORIZONTAL

SLIDER
278
417
508
450
max-memory
max-memory
10
100
80.0
10
1
ticks
HORIZONTAL

SLIDER
1
431
233
464
attack-gain
attack-gain
0
1
0.45258745548927537
0.01
1
NIL
HORIZONTAL

SLIDER
276
561
508
594
attack-loss
attack-loss
0
1
0.681751953009025
0.01
1
NIL
HORIZONTAL

@#$#@#$#@
## COSA IN QUESTA VERSIONE IN PIU

1) ci si può attaccare solo se si è sopra all'altro, non a distanza. Quindi non è necessario attaccare per ottenere l'energia, ma se si attacca questa dura di più
2) tolto il consumo di energia tranne quello base (perché volevo avere meno robe e alla fine non ha senso renderlo così sofisticato se per definizione deve essere semplice)

## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="01-01-2021" repetitions="30000" sequentialRunOrder="false" runMetricsEveryStep="false">
    <setup>set size-world 15 + random 20
set spices-saturation random-float 10
set energy-spice random-float 10
set vision 1 + random-float 4
set max-energy 2 + random-float 8
set energy-in-per-tick 0.2 + random-float 1.8
set energy-consume-basic random-float 0.25
set attack-chance random-float 1
set attack-gain random-float 1
set attack-loss random-float 1
set reproduction-rate 0.01 + random-float 0.09

set avg-life 50 + random 951
set max-memory 1 + random 100
set learning-weight random-float 1
set learning-trasmission random-float 1
set exploration-rate random-float 1
set exploration-direction-changing-time 1 + random 10

set max-rissets min list ( 100 + random 200 ) int ( ( ( size-world + 1 ) ^ 2 ) * 0.95 )
set init-rissets max-rissets
set init-energy max-energy * 0.5 + random-float ( max-energy * 0.5 )
 
setup</setup>
    <go>go</go>
    <timeLimit steps="4000"/>
    <metric>size-world</metric>
    <metric>init-energy</metric>
    <metric>spices-saturation</metric>
    <metric>energy-spice</metric>
    <metric>vision</metric>
    <metric>max-energy</metric>
    <metric>energy-in-per-tick</metric>
    <metric>energy-consume-basic</metric>
    <metric>attack-chance</metric>
    <metric>reproduction-rate</metric>
    <metric>max-rissets</metric>
    <metric>avg-life</metric>
    <metric>max-memory</metric>
    <metric>learning-weight</metric>
    <metric>learning-trasmission</metric>
    <metric>exploration-direction-changing-time</metric>
    <metric>exploration-rate</metric>
    <metric>attack-loss</metric>
    <metric>attack-gain</metric>
    <metric>count rissets</metric>
    <metric>mean-energy</metric>
    <metric>stddev-energy</metric>
    <metric>skew-energy</metric>
    <metric>kurt-energy</metric>
    <metric>item 0 countactions</metric>
    <metric>item 1 countactions</metric>
    <metric>item 2 countactions</metric>
    <metric>item 3 countactions</metric>
    <metric>item 0 countactions-begin</metric>
    <metric>item 1 countactions-begin</metric>
    <metric>item 2 countactions-begin</metric>
    <metric>item 3 countactions-begin</metric>
    <metric>item 0 countactions-end</metric>
    <metric>item 1 countactions-end</metric>
    <metric>item 2 countactions-end</metric>
    <metric>item 3 countactions-end</metric>
    <metric>item 0 mean-genotype</metric>
    <metric>item 1 mean-genotype</metric>
    <metric>item 0 stddev-genotype</metric>
    <metric>item 1 stddev-genotype</metric>
    <metric>item 0 skew-genotype</metric>
    <metric>item 1 skew-genotype</metric>
    <metric>item 0 kurt-genotype</metric>
    <metric>item 1 kurt-genotype</metric>
    <metric>item 0 mean-weight</metric>
    <metric>item 1 mean-weight</metric>
    <metric>item 0 stddev-weight</metric>
    <metric>item 1 stddev-weight</metric>
    <metric>item 0 skew-weight</metric>
    <metric>item 1 skew-weight</metric>
    <metric>item 0 kurt-weight</metric>
    <metric>item 1 kurt-weight</metric>
    <metric>death-energy</metric>
    <metric>death-age</metric>
    <metric>death-fight</metric>
    <enumeratedValueSet variable="mutation-rate">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="mutation-intensity">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="length-simulation">
      <value value="3990"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
