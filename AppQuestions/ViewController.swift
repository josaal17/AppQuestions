//
//  ViewController.swift
//  AppQuestions
//
//  Created by MacBookDesarrolloTecno on 5/5/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelPregunta: UILabel!
    @IBOutlet weak var labelControlPregunta: UILabel!
    @IBOutlet weak var buttonText: UIButton!
    
    var contador:Int = 0
    
    var preguntas:NSArray = ["¿Tengo hermanos?","¿Tengo abuela (abuelo) vivos?","¿Tengo mascota?","¿Me gusta jugar con los Lego?","¿Es el coche de mi papá negro?","¿Me gusta la pizza?","¿Me gusta el pescado?","¿Puedo montar en bicicleta?","¿Me gusta jugar con los trenes?","¿Tengo gafas?","¿Soy un niño? ","¿Tengo trabajo?","¿Está lloviendo?","¿Se nadar?","¿Soy celoso?","¿Tengo super poderes?","¿Me gusta viajar?","¿Tengo carro?","¿Soy desarrollador?","¿Voy al gym?"]
    let respuestaCorrecta:NSArray = ["false","true","true","true","false","true","false","true","false","false","false","true","false","true","false","false","true","true","true","false"]
    var respuesta:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showQuestion()
        self.controlPregunta(paramContador: contador)
        print("contador: ",contador)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showQuestion()
    {
        self.labelPregunta.text = String(preguntas[contador] as! String)
    }


    @IBAction func buttonRespuestaSi(_ sender: UIButton) {
        ValorRespuesta(respuesta: "true")
    }
    
    @IBAction func buttonRespuestaNo(_ sender: UIButton) {
        ValorRespuesta(respuesta: "false")
    }
    
    func ValorRespuesta(respuesta:NSString) {
        self.respuesta.adding(respuesta)
        contador=contador+1
        //self.showQuestion()
    }
    @IBAction func buttonEnviaRespueseta(_ sender: UIButton) {
        print("contador boton: ",contador)
        if (contador < preguntas.count) {
            self.showQuestion()
            self.controlPregunta(paramContador: contador)
        }
        else
        {
            self.buttonText.setTitle("Resultados", for: .normal)
            //self.showQuestion()
            //self.controlPregunta(paramContador: contador)
            self.score()
        }
    }
    
    func controlPregunta(paramContador:Int) {
        self.labelControlPregunta.text = "\("Pregunta:") \(contador+1) \("de") \(preguntas.count)"
    }
    
    func score() {
        self.labelControlPregunta.text = String(respuesta.count)
    }
}

