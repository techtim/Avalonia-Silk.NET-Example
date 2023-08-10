using System;
using System.Drawing;
using System.Numerics;
using Avalonia.OpenGL;
using Avalonia.OpenGL.Controls;
using Avalonia.Threading;
using Silk.NET.OpenGL;

namespace Tutorial
{
    public class LineExample : OpenGlControlBase
    {
        private GL Gl;
        private BufferObject<float> Vbo;
        private VertexArrayObject<float, uint> Vao;
        private Shader Shader;
        
        private static readonly float[] Vertices =
        {
            //X    Y      Z 
            0.0f, 0.0f, 0.0f,
            1.0f, 0.0f, 0.0f,
            0.0f, 1.0f, 0.0f,
            1.0f, 1.0f, 0.0f
        };

        protected override void OnOpenGlInit(GlInterface gl, int fb)
        {
            base.OnOpenGlInit(gl, fb);

            Gl = GL.GetApi(gl.GetProcAddress);

            //Instantiating our new abstractions
            Vbo = new BufferObject<float>(Gl, Vertices, BufferTargetARB.ArrayBuffer);
            Vao = new VertexArrayObject<float, uint>(Gl, Vbo);

            //Telling the VAO object how to lay out the attribute pointers
            Vao.VertexAttributePointer(0, 3, VertexAttribPointerType.Float, 3, 0);

            Shader = new Shader(Gl, "lines.vert", "lines.frag");
        }


        protected override void OnOpenGlDeinit(GlInterface gl, int fb)
        {
            Vbo.Dispose();
            Vao.Dispose();
            Shader.Dispose();
            base.OnOpenGlDeinit(gl, fb);
        }

        protected override unsafe void OnOpenGlRender(GlInterface gl, int fb)
        {
            Gl.ClearColor(Color.Black);
            Gl.Clear((uint)(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit));
            Gl.Enable(EnableCap.DepthTest);
            Gl.Viewport(0, 0, (uint)Bounds.Width, (uint)Bounds.Height);
            
            Vao.Bind();
            Shader.Use();
            Shader.SetUniform("RENDERSIZE", new Vector2((float)Bounds.Width, (float)Bounds.Height));
            Shader.SetUniform("shift", (float)DateTime.Now.Millisecond % 1000 / 1000f );
            Shader.SetUniform("angle", 0.5f);
            Shader.SetUniform("line_width", (float)Math.Cos(DateTime.Now.Millisecond / 1000f )*0.5f);
            Shader.SetUniform("spacing", 0.5f);
            Shader.SetUniform("color1", new Vector4(0.0f, 1.0f, 0.5f, 1.0f));
            Shader.SetUniform("color2", new Vector4(0.3f, 0.0f, 0.3f, 1.0f));
            
            Gl.DrawArrays(PrimitiveType.TriangleStrip, 0, 4);
            Dispatcher.UIThread.Post(InvalidateVisual, DispatcherPriority.Background);
        }
    }
}