Read me Important ( English and Português )

///////   English
//The codes are simple, but some changes have been made. This "SknowBasic" is an edited crash shader. Be careful when using it, as it consumes VRAM, GPU, CPU, and BUFFER. It is recommended not to use it at full capacity, as Unity won’t support that, and it may cause a crash. I suggest always saving your project using the shortcut (CTRL + S) to ensure you don’t lose any progress.

//Here are some useful pieces of information, as this is the basics:

Shader "Sknow/Basic"  
{  
    Properties  
    {  
        _safe ("Texture", 2D) = "black" {}  
        [HideInInspector] _Strength ("Strength", Float) = 0.01  
        _Cutoff ("Alpha cutoff", Range(0, 1)) = 1  
        _Toggle ("GPU Load", Range(0.1, 10000000)) = 0  
        _VRAMToggle ("VRAM Load", Int) = 0  
        _VRAMTex ("VRAM Texture", 2D) = "white" {}  
        _CPULoad ("CPU Load", Range(0.1, 10000000)) = 0  
        _Sknow ("RANGE OF GPU", Int) = 0.4  
    }  
}
//These are the properties. They show important information, such as the parameter _Toggle("GPU Load", Range(0.1, 10000000)) = 0. You can see that the "RANGE" is between 0.1 and 10,000,000. It is best to leave it at 0, as this prevents overheating of the GPU. If the value is set to 0.1 or more, the GPU will begin to heat up, which is true for all other properties.

//Broken down, it looks like this:

//Code:
_Toggle("GPU Load", Range(0.1, 10000000)) = 0

//Demonstration in the Unity Inspector:

GPU LOAD (0)

//The (0) means that it is disabled. Setting it to 0.1 or higher will cause the GPU to heat up, which applies to all other properties.

---------------------------------------------------------------------------------------------------------------------------------------------
////                  Português
//Os códigos são simples, mas algumas alterações foram feitas. Este "SknowBasic" é um shader de crash editado. Tenha cuidado ao usá-lo, pois ele consome VRAM, GPU, CPU e BUFFER. É recomendado não usar sua capacidade total, pois a Unity não suportará, e isso pode causar um crash. Sugiro sempre salvar o projeto utilizando o atalho (CTRL + S) para garantir que não haja perda de progresso.

//Aqui estão algumas informações úteis, já que isso é o básico:
Shader "Sknow/Basic"  
{  
    Properties  
    {  
        _safe ("Texture", 2D) = "black" {}  
        [HideInInspector] _Strength ("Strength", Float) = 0.01  
        _Cutoff ("Alpha cutoff", Range(0, 1)) = 1  
        _Toggle ("GPU Load", Range(0.1, 10000000)) = 0  
        _VRAMToggle ("VRAM Load", Int) = 0  
        _VRAMTex ("VRAM Texture", 2D) = "white" {}  
        _CPULoad ("CPU Load", Range(0.1, 10000000)) = 0  
        _Sknow ("RANGE OF GPU", Int) = 0.4  
    }  
}

//Essas são as propriedades. Elas mostram informações importantes, como o parâmetro _Toggle("GPU Load", Range(0.1, 10000000)) = 0. Você pode ver que no "RANGE" está entre 0.1 e 10.000.000. O ideal é deixar em 0, pois assim não ocorrerá superaquecimento da GPU. Se o valor for definido como 0.1 ou mais, a GPU começará a aquecer, e isso se aplica a todas as outras propriedades.

//Por partes, ficaria assim:

//Código:
_Toggle("GPU Load", Range(0.1, 10000000)) = 0

//Demonstração no Inspector do Unity:

GPU LOAD (0)

//O (0) significa que está desativado. Ao deixar em 0.1 ou mais, a GPU começará a aquecer, o que se aplica a todas as outras propriedades.
