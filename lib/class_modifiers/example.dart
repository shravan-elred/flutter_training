//? base

//* can be constructed
// final BaseClass a = BaseClass();

//* can be extended.
// base class Person extends BaseClass {}

//* cannot be implemented.
// base class Person implements BaseClass {}

//? interface

//* can be constructed.
// InterfaceClass b = InterfaceClass();

//* cannot be inherited.
// class Person extends InterfaceClass {}

//* can be implemented.
// class Person implements InterfaceClass {}

//? final

//* can be constructed.
// FinalClass c = FinalClass();

//* cannot be inherited.
// class Person extends FinalClass {}

//* cannot be implemented.
// class Person implements FinalClass {}


//? sealed

//* can be extended inside same library
// class Person extends SealedClass {}

//* Cannot be instantiated.
// SealedClass d = SealedClass();

// Subclasses can be instantiated.
// Person p = Person();

