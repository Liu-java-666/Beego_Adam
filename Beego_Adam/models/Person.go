package models

type Person struct {
	Id int
	Name string
}

func (this *Person) GetPerson() (Person){
	return Person{Id:1,Name:"fly"}
}