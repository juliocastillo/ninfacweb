<?php

namespace Bundles\CatalogosBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class CfgFormatoDocumentoAdmin extends Admin
{
    /**
     * @param DatagridMapper $datagridMapper
     */
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('id')
            ->add('detalleInterlineado')
            ->add('detalleNumeroItems')
            ->add('detalleXCol1')
            ->add('detalleY')
            ->add('fila1Col1')
            ->add('fila1Col2')
            ->add('fila2Col1')
            ->add('fila2Col2')
            ->add('fila3Col1')
            ->add('fila3Col2')
            ->add('fila4Col1')
            ->add('fila4Col2')
            ->add('fila5Col1')
            ->add('fila5Col2')
            ->add('fila6Col1')
            ->add('fila6Col2')
            ->add('fila7Col1')
            ->add('fila7Col2')
            ->add('margenDerecho')
            ->add('margenInferior')
            ->add('margenIzquierdo')
            ->add('margenSuperior')
            ->add('nombre')
            ->add('detalleXCol2')
            ->add('detalleXCol3')
            ->add('detalleXCol4')
            ->add('detalleXCol5')
            ->add('pieY')
            ->add('pieXCol1')
            ->add('pieXCol2')
            ->add('detalleXCol6')
        ;
    }

    /**
     * @param ListMapper $listMapper
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->add('nombre')
            ->add('idPlantilla')
            ->add('_action', 'actions', array(
                'actions' => array(
                    'show' => array(),
                    'edit' => array(),
                    'delete' => array(),
                )
            ))
        ;
    }

    /**
     * @param FormMapper $formMapper
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper
            ->tab('Página')
                ->with('')
            ->add('nombre')
            ->add('idPlantilla')
            ->add('idFontName')
            ->add('idFontSize')
            ->add('margenDerecho')
            ->add('margenIzquierdo')
            ->add('margenSuperior')
            ->add('margenInferior')
            ->add('papel','choice',array(
                'label'=>'Tamaño papel',
                'choices' => array('Letter'=>'Carta', 'Legal'=>'Oficio')))
            ->end()
            ->end()
            ->tab('Datos generales')
                ->with('')
            ->add('interlineado')    
            ->add('fila1Col1')
            ->add('fila1Col2')
            ->add('fila2Col1')
            ->add('fila2Col2')
            ->add('fila3Col1')
            ->add('fila3Col2')
            ->add('fila4Col1')
            ->add('fila4Col2')
            ->add('fila5Col1')
            ->add('fila5Col2')
            ->add('fila6Col1')
            ->add('fila6Col2')
            ->add('fila7Col1')
            ->add('fila7Col2')
            ->end()
            ->end()
            ->tab('Detalle')
                ->with('')
            ->add('detalleInterlineado')
            ->add('detalleNumeroItems')
            ->add('detalleY')
            ->add('detalleXCol1')
            ->add('detalleXCol2')
            ->add('detalleXCol3')
            ->add('detalleXCol4')
            ->add('detalleXCol5')
            ->add('detalleXCol6')
            ->end()
            ->end()
            ->tab('Pié de página')
                ->with('')
            ->add('pieY')
            ->add('pieXCol1')
            ->add('pieXCol2')
        ;
    }

    /**
     * @param ShowMapper $showMapper
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->add('id')
            ->add('detalleInterlineado')
            ->add('detalleNumeroItems')
            ->add('detalleXCol1')
            ->add('detalleY')
            ->add('fial1Col1')
            ->add('fila1Col2')
            ->add('fila2Col1')
            ->add('fila2Col2')
            ->add('fila3Col1')
            ->add('fila3Col2')
            ->add('fila4Col1')
            ->add('fila4Col2')
            ->add('fila5Col1')
            ->add('fila5Col2')
            ->add('fila6Col1')
            ->add('fila6Col2')
            ->add('fila7Col1')
            ->add('fila7Col2')
            ->add('margenDerecho')
            ->add('margenInferior')
            ->add('margenIzquierdo')
            ->add('margenSuperior')
            ->add('nombre')
            ->add('detalleXCol2')
            ->add('detalleXCol3')
            ->add('detalleXCol4')
            ->add('detalleXCol5')
            ->add('pieY')
            ->add('pieXCol1')
            ->add('pieXCol2')
            ->add('detalleXCol6')
        ;
    }
}
