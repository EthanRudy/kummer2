#ifndef _TEMPEX_H
#define _TEMPEX_H

template <class DataType>
class TemplateExample
{
  public:
    // constructor
    TemplateExample();

    // member function
    void     SetValue(DataType NewValue);
    DataType Value();

  private:
    DataType data;
};

template <class DataType>
TemplateExample <DataType>::TemplateExample()
{
}

template <class DataType>
void TemplateExample <DataType>::SetValue(DataType NewValue)
{
  data = NewValue;
}

template <class DataType>
DataType TemplateExample <DataType>::Value()
{
  return(data);
}
#endif